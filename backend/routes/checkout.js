const express = require('express');
const router = express.Router();
const checkoutController = require('../controllers/checkoutController');

// Checkout page
router.get('/checkout', checkoutController.renderCheckoutPage);

// Place order
router.post('/checkout', checkoutController.placeOrder);

module.exports = router;
