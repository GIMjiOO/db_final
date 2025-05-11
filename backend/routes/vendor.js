const express = require('express');
const router = express.Router();
const vendorController = require('../controllers/vendorController');

// 1. Vendor Manager main page (sample data or count from DB)
router.get('/vendor-manager', vendorController.renderVendorManager);

// 2. Account pending verification list
router.get('/account-pending-verification', vendorController.getPendingVendors);

// 3. View single account to verify
router.get('/verify-account/:citizenId', vendorController.getVendorByCitizenId);

// 4. POST routes for allow/deny
router.post('/verify-account/:citizenId/allow', vendorController.allowVendor);
router.post('/verify-account/:citizenId/deny', vendorController.denyVendor);

// Store rating management routes - protected by admin middleware
router.get('/store-rating-low', vendorController.getLowRatedStores);
router.post('/warn', vendorController.warnStore);
router.post('/ban', vendorController.banStore);

// Route to manually trigger rating calculations (for admin use or scheduled jobs)
router.get('/calculate-ratings', vendorController.calculateRatings);

module.exports = router;
