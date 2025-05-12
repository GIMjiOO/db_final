const db = require('../config/db');

exports.getCartItemsByUserId = (userId) => {
    return new Promise((resolve, reject) => {
        db.query(`
            SELECT ca.customer_id as userId, p.name, p.price, c.quantity, p.image_url as image, c.added_at as date
            FROM Cart_Items c
            JOIN Products p ON c.product_id = p.product_id
            JOIN Carts ca ON c.cart_id = ca.cart_id
            WHERE ca.customer_id = ?
        `, [userId], (err, results) => {
            if (err) reject(err);
            else resolve(results);
        });
    });
};

exports.getOrCreateDefaultAddress = (customerId) => {
    return new Promise((resolve, reject) => {
        db.query(`
            SELECT 
                c.first_name, 
                c.last_name,
                a.address_line1, 
                a.address_line2, 
                a.city, 
                a.state, 
                a.postal_code, 
                a.country
            FROM Customers c
            JOIN Customer_Addresses a ON c.customer_id = a.customer_id
            WHERE c.customer_id = ?
            LIMIT 1
        `, [customerId], (err, results) => {
            if (err) return reject(err);

            if (results.length > 0) {
                const row = results[0];
                resolve({
                    name: `${row.first_name} ${row.last_name}`,
                    detail: `${row.address_line1}${row.address_line2 ? ', ' + row.address_line2 : ''}, ${row.city}, ${row.state}, ${row.postal_code}, ${row.country}`
                });
            } else {
                // No address found, insert a default one
                const defaultAddress = {
                    address_line1: '123 Placeholder St',
                    address_line2: '',
                    city: 'Bangkok',
                    state: 'Bangkok',
                    postal_code: '10100',
                    country: 'Thailand'
                };

                db.query(`
                    INSERT INTO Customer_Addresses 
                    (customer_id, address_line1, address_line2, city, state, postal_code, country, created_at)
                    VALUES (?, ?, ?, ?, ?, ?, ?, NOW())
                `, [
                    customerId,
                    defaultAddress.address_line1,
                    defaultAddress.address_line2,
                    defaultAddress.city,
                    defaultAddress.state,
                    defaultAddress.postal_code,
                    defaultAddress.country
                ], (insertErr) => {
                    if (insertErr) return reject(insertErr);

                    // Get the customer name after insert
                    db.query(`
                        SELECT first_name, last_name FROM Customers
                        WHERE customer_id = ?
                    `, [customerId], (nameErr, nameResults) => {
                        if (nameErr) return reject(nameErr);

                        const customer = nameResults[0];
                        resolve({
                            name: `${customer.first_name} ${customer.last_name}`,
                            detail: `${defaultAddress.address_line1}, ${defaultAddress.city}, ${defaultAddress.state}, ${defaultAddress.postal_code}, ${defaultAddress.country}`
                        });
                    });
                });
            }
        });
    });
};


exports.placeOrder = (userId, totalAmount) => {
    return new Promise((resolve, reject) => {
        db.query(`
            INSERT INTO orders (user_id, total_amount, order_date)
            VALUES (?, ?, NOW())
        `, [userId, totalAmount], (err, result) => {
            if (err) reject(err);
            else resolve(result.insertId);
        });
    });
};
