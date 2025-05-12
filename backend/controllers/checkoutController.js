const checkoutModel = require('../models/checkoutModel');

exports.renderCheckoutPage = async (req, res) => {
    //const userId = req.session.userId; // assume session contains userId
    const userId = 1;
    try {
        const cartItems = await checkoutModel.getCartItemsByUserId(userId);
        const defaultAddress = await checkoutModel.getOrCreateDefaultAddress(userId);

        const subtotal = cartItems.reduce((sum, item) => sum + item.price * item.quantity, 0);
        const shippingCost = 50; // fixed shipping

        res.render('customer/4-Check_out', {
            cartItems,
            defaultAddress,
            subtotal,
            shippingCost
        });
    } catch (err) {
        console.error(err);
        res.status(500).send("Internal Server Error");
    }
};

exports.placeOrder = async (req, res) => {
    const userId = req.session.userId;
    try {
        const cartItems = await checkoutModel.getCartItemsByUserId(userId);
        const subtotal = cartItems.reduce((sum, item) => sum + item.price * item.quantity, 0);
        const shippingCost = 50;
        const total = subtotal + shippingCost;

        const orderId = await checkoutModel.placeOrder(userId, total);

        // Optionally clear cart here

        res.redirect('/order-success'); // or send JSON if API
    } catch (err) {
        console.error(err);
        res.status(500).send("Could not place order");
    }
};
