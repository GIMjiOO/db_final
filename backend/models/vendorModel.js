// models/vendorModel.js
const db = require('../config/db');

const Vendor = {
    // Get all vendors whose status is 'pending'
    getAllPending: () => {
        return new Promise((resolve, reject) => {
            const query = `SELECT citizen_id AS citizenId, created_at AS date FROM Sellers WHERE qualification_status = 0`;
            db.query(query, (err, results) => {
                if (err) return reject(err);
                resolve(results);
            });
        });
    },

    // Get full vendor details by citizen ID
    getByCitizenId: (citizenId) => {
        return new Promise((resolve, reject) => {
            const query = `SELECT
            Sellers.citizen_id AS citizenId,
            Sellers.store_name AS storeName,
            Sellers.phone_number AS phone,
            Sellers.owner_name AS name,
            Sellers.email,
            Sellers.business_address AS address,
            Seller_Bank_Accounts.bank_name AS bank,
            Seller_Bank_Accounts.account_number AS bankAccount,
            image_url AS imageUrl
            FROM
            Sellers
            INNER JOIN Seller_Bank_Accounts ON Sellers.citizen_id = Seller_Bank_Accounts.citizen_id
            WHERE Sellers.citizen_id = ?`;
            db.query(query, [citizenId], (err, results) => {
                if (err) return reject(err);
                resolve(results[0]);
            });
        });
    },

    // Update vendor's verification status
    updateStatus: (citizenId, status) => {
        return new Promise((resolve, reject) => {
            const query = `UPDATE Sellers SET qualification_status = ? WHERE citizen_id = ?`;
            db.query(query, [status, citizenId], (err, result) => {
                if (err) return reject(err);
                resolve(result);
            });
        });
    },

    // Count vendors whose status is pending
    countPending: () => {
        return new Promise((resolve, reject) => {
            const query = `SELECT COUNT(*) AS count FROM Sellers WHERE qualification_status = 0`;
            db.query(query, (err, results) => {
                if (err) return reject(err);
                resolve(results[0].count);
            });
        });
    },

    // Count vendors with low store rating (threshold can be changed)
    countLowRating: () => {
        return new Promise((resolve, reject) => {
            const query = `SELECT COUNT(*) AS count FROM Sellers WHERE srl_status IN (0, 2, 3, 4)`;
            db.query(query, (err, results) => {
                if (err) return reject(err);
                resolve(results[0].count);
            });
        });
    },

// Get all low-rated stores for admin view
    getLowRatedStores: () => {
        return new Promise((resolve, reject) => {
            const query = `
                SELECT 
                    s.citizen_id as id,
                    s.avg_rating as ratingAfter,
                    s.srl_date as date,
                    CASE 
                        WHEN s.srl_status = 1 THEN 'passed'
                        WHEN s.srl_status = 2 THEN 'pending'
                        WHEN s.srl_status = 3 THEN 'not yet warned'
                        WHEN s.srl_status = 4 THEN 'failed'
                        WHEN s.srl_status = 5 THEN 'banned'
                    END as status
                FROM 
                    Sellers s
                WHERE 
                    s.avg_rating < 2.5 OR s.srl_status IN (2, 3, 4, 5)
                ORDER BY 
                    s.srl_status DESC, s.avg_rating ASC`;
                    
            db.query(query, (err, results) => {
                if (err) return reject(err);
                
                // We need to get the "before" ratings as well
                const stores = results;
                const beforePromises = stores.map(store => {
                    return module.exports.getRatingBefore(store.id)
                        .then(ratingBefore => {
                            store.ratingBefore = ratingBefore || 0;
                            return store;
                        });
                });
                
                Promise.all(beforePromises)
                    .then(completeStores => {
                        resolve(completeStores);
                    })
                    .catch(reject);
            });
        });
    },
    
    // Warn a store - update status to "pending"
    warnStore: (citizenId) => {
        return new Promise((resolve, reject) => {
            const query = `
                UPDATE Sellers 
                SET srl_status = 2 
                WHERE citizen_id = ?`;
                
            db.query(query, [citizenId], (err, result) => {
                if (err) return reject(err);
                resolve(result);
            });
        });
    },
    
    // Ban a store - update status to "banned" and set qualification_status to 0
    banStore: (citizenId) => {
        return new Promise((resolve, reject) => {
            const query = `
                UPDATE Sellers 
                SET 
                    srl_status = 5,
                    qualification_status = 0
                WHERE 
                    citizen_id = ?`;
                
            db.query(query, [citizenId], (err, result) => {
                if (err) return reject(err);
                resolve(result);
            });
        });
    },
    
    // Calculate and update all store ratings
    calculateStoreRatings: () => {
        return module.exports.performScheduledRatingCheck();
    },
    
    // Updated function to calculate and update a store's rating
    updateStoreRating: (citizenId) => {
        return new Promise((resolve, reject) => {
            // Step 1: Get current store info
            const storeQuery = `
                SELECT 
                    srl_date, 
                    srl_date_previous, 
                    avg_rating, 
                    srl_status 
                FROM 
                    Sellers 
                WHERE 
                    citizen_id = ?`;
                    
            db.query(storeQuery, [citizenId], (err, storeResult) => {
                if (err) return reject(err);
                
                const store = storeResult[0] || {};
                const currentRating = store.avg_rating || 0;
                const currentStatus = store.srl_status || 3; // Default to "Not yet warned"
                
                // Step 2: Get all products for this store
                const productQuery = `
                    SELECT product_id 
                    FROM Products 
                    WHERE citizen_id = ?`;
                    
                db.query(productQuery, [citizenId], (err, products) => {
                    if (err) return reject(err);
                    
                    if (products.length === 0) {
                        // No products, set rating to 0
                        return saveRatingAndDates(citizenId, 0, currentStatus, store.srl_date);
                    }
                    
                    // Step 3: Calculate new rating based on all reviews
                    const productIds = products.map(p => p.product_id);
                    const ratingQuery = `
                        SELECT AVG(rating) as avg_rating 
                        FROM Reviews 
                        WHERE product_id IN (?)`;
                        
                    db.query(ratingQuery, [productIds], (err, ratingResult) => {
                        if (err) return reject(err);
                        
                        const newRating = ratingResult[0].avg_rating || 0;
                        let newStatus = determineNewStatus(currentStatus, currentRating, newRating);
                        
                        // Step 4: Update the store with new rating and dates
                        saveRatingAndDates(citizenId, newRating, newStatus, store.srl_date)
                            .then(result => {
                                resolve({
                                    citizenId,
                                    oldRating: currentRating,
                                    newRating,
                                    oldStatus: currentStatus,
                                    newStatus
                                });
                            })
                            .catch(reject);
                    });
                });
            });
        });
        
        // Helper function to determine new status based on ratings
        function determineNewStatus(currentStatus, oldRating, newRating) {
            if (newRating < 2.5 && (currentStatus === 1 || currentStatus === null)) {
                // If rating drops below threshold, set to "Not yet warned"
                return 3;
            } else if (currentStatus === 2) { // If Pending
                if (newRating >= 2.5) {
                    // Rating improved above threshold
                    return 1; // Passed
                } else if (newRating < oldRating) {
                    // Rating got worse
                    return 4; // Failed
                }
            }
            return currentStatus; // No change
        }
        
        // Helper function to save rating and update dates
        function saveRatingAndDates(citizenId, rating, status, currentDate) {
            return new Promise((resolve, reject) => {
                const now = new Date();
                
                // Important: Always save the current date as previous before updating
                const query = `
                    UPDATE Sellers 
                    SET 
                        srl_date_previous = srl_date,
                        srl_date = ?,
                        avg_rating = ?,
                        srl_status = ?
                    WHERE 
                        citizen_id = ?`;
                    
                db.query(query, [now, rating, status, citizenId], (err, result) => {
                    if (err) return reject(err);
                    resolve(result);
                });
            });
        }
    },

    // Separate function to get the rating before a specific date
    getRatingBefore: (citizenId) => {
        return new Promise((resolve, reject) => {
            // Step 1: Get the previous check date
            const dateQuery = `
                SELECT 
                    srl_date_previous,
                    srl_date
                FROM 
                    Sellers 
                WHERE 
                    citizen_id = ?`;
                    
            db.query(dateQuery, [citizenId], (err, dateResult) => {
                if (err) return reject(err);
                
                // If no previous date, return current rating
                if (!dateResult[0] || !dateResult[0].srl_date_previous) {
                    return resolve(null);
                }
                
                const previousDate = dateResult[0].srl_date_previous;
                
                // Step 2: Get all products for this store
                const productQuery = `
                    SELECT product_id 
                    FROM Products 
                    WHERE citizen_id = ?`;
                    
                db.query(productQuery, [citizenId], (err, products) => {
                    if (err) return reject(err);
                    if (products.length === 0) return resolve(0);
                    
                    const productIds = products.map(p => p.product_id);
                    
                    // Step 3: Get average rating from reviews BEFORE the previous check date
                    // This shows what the rating was at the time of the previous check
                    const ratingQuery = `
                        SELECT AVG(rating) as avg_rating 
                        FROM Reviews 
                        WHERE product_id IN (?) 
                        AND created_at < ?`;
                        
                    db.query(ratingQuery, [productIds, previousDate], (err, ratingResult) => {
                        if (err) return reject(err);
                        resolve(ratingResult[0].avg_rating || 0);
                    });
                });
            });
        });
    },

    // Complete function to handle the 3-month check process
    performScheduledRatingCheck: () => {
        return new Promise((resolve, reject) => {
            // Get all sellers
            const query = `
                SELECT 
                    citizen_id, 
                    srl_date, 
                    srl_date_previous, 
                    avg_rating, 
                    srl_status 
                FROM 
                    Sellers`;
                    
            db.query(query, (err, sellers) => {
                if (err) return reject(err);
                
                const today = new Date();
                const updates = [];
                const log = [];
                
                sellers.forEach(seller => {
                    // Check if initial rating or 3+ months since last check
                    let needsCheck = false;
                    
                    if (!seller.srl_date) {
                        // First time check
                        needsCheck = true;
                        log.push(`${seller.citizen_id}: First check`);
                    } else {
                        // Calculate months since last check
                        const lastCheckDate = new Date(seller.srl_date);
                        const monthsDiff = (today.getFullYear() - lastCheckDate.getFullYear()) * 12 + 
                                         (today.getMonth() - lastCheckDate.getMonth());
                        
                        if (monthsDiff >= 3) {
                            needsCheck = true;
                            log.push(`${seller.citizen_id}: ${monthsDiff} months since last check`);
                        }
                    }
                    
                    if (needsCheck) {
                        updates.push(module.exports.updateStoreRating(seller.citizen_id));
                    }
                });
                
                Promise.all(updates)
                    .then(results => {
                        resolve({
                            success: true,
                            message: `Updated ${updates.length} sellers`,
                            log,
                            results
                        });
                    })
                    .catch(error => reject(error));
            });
        });
    }


};

module.exports = Vendor;
