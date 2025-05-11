const Vendor = require('../models/vendorModel');
const db = require('../config/db');

exports.renderVendorManager = async (req, res) => {
    try {
        const pending = await Vendor.countPending();
        const lowRating = await Vendor.countLowRating(); // assume you handle this
        res.render('admin/3-1_Vendor_Manager', {
            accountPendingCount: pending,
            storeRatingLowCount: lowRating
        });
    } catch (err) {
        res.status(500).send('Error loading vendor manager page');
    }
};

exports.getPendingVendors = async (req, res) => {
    try {
        const vendors = await Vendor.getAllPending();
        res.render('admin/3-1-1_Account_pending_verification', { accounts: vendors });
    } catch (err) {
        res.status(500).send('Error fetching pending vendors');
    }
};

exports.getVendorByCitizenId = async (req, res) => {
    try {
        const vendor = await Vendor.getByCitizenId(req.params.citizenId);
        res.render('admin/3-1-1-1_Verify_Account_Pending_Verification', { account: vendor });
    } catch (err) {
        res.status(500).send('Error loading account details');
    }
};

exports.allowVendor = async (req, res) => {
    try {
        await Vendor.updateStatus(req.params.citizenId, 1);
        res.redirect('/account-pending-verification');
    } catch (err) {
        res.status(500).send('Error approving vendor');
    }
};

exports.denyVendor = async (req, res) => {
    try {
        await Vendor.updateStatus(req.params.citizenId, 0);
        res.redirect('/account-pending-verification');
    } catch (err) {
        res.status(500).send('Error denying vendor');
    }
};

// Display low rated stores in admin dashboard
exports.getLowRatedStores = (req, res) => {
    // Step 1: Get all sellers to check their srl_date
    const query = `
        SELECT citizen_id, srl_date 
        FROM Sellers`;
    
    db.query(query, (err, sellers) => {
        if (err) {
            console.error('Error fetching sellers:', err);
            return res.status(500).send('Server error');
        }

        const today = new Date();
        const threeMonthsInMillis = 3 * 30 * 24 * 60 * 60 * 1000; // Approximate 3 months in milliseconds
        let needsCalculation = false;

        // Step 2: Check each seller's srl_date
        sellers.forEach(seller => {
            const srlDate = new Date(seller.srl_date);
            const timeDiff = today - srlDate;

            if (timeDiff >= threeMonthsInMillis) {
                needsCalculation = true; // At least one seller needs a rating calculation
            }
        });

        // Step 3: Trigger rating calculation if needed
        if (needsCalculation) {
            Vendor.calculateStoreRatings()
            .then(() => {
                // After calculation, fetch low-rated stores
                return Vendor.getLowRatedStores();
            })
            .then(stores => {
                // Render the view with the low-rated stores
                res.render('admin/3-1-2_Store_Rating_Low', { stores });
            })
            .catch(err => {
                console.error('Error calculating ratings:', err);
                res.status(500).send('Server error');
            });
        } else {
            // If no calculation is needed, just fetch low-rated stores
            Vendor.getLowRatedStores()
            .then(stores => {
                console.log('Stores:', stores); // Debugging line
                res.render('admin/3-1-2_Store_Rating_Low', { stores });
            })
            .catch(err => {
                console.error('Error getting low rated stores:', err);
                res.status(500).send('Server error');
            });
        }
    });
};


// Handle warning a store (setting to "pending" status)
exports.warnStore = (req, res) => {
    const { storeId } = req.body;
    console.log('Warning store with ID:', storeId); // Debugging line
    Vendor.warnStore(storeId)
        .then(() => {
            res.redirect('/store-rating-low');
        })
        .catch(err => {
            console.error('Error warning store:', err);
            res.status(500).send('Server error');
        });
};

// Handle banning a store (setting to "banned" status and setting qualification_status to 0)
exports.banStore = (req, res) => {
    const { storeId } = req.body;
    console.log('Banning store with ID:', storeId); // Debugging line
    Vendor.banStore(storeId)
        .then(() => {
            res.redirect('/store-rating-low');
        })
        .catch(err => {
            console.error('Error banning store:', err);
            res.status(500).send('Server error');
        });
};

// Scheduled job to calculate ratings
exports.calculateRatings = (req, res) => {
    Vendor.calculateStoreRatings()
        .then(result => {
            if (res) {
                res.json(result);
            } else {
                console.log('Rating calculation complete:', result);
            }
        })
        .catch(err => {
            console.error('Error calculating ratings:', err);
            if (res) {
                res.status(500).send('Server error');
            }
        });
};
