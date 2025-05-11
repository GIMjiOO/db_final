const express = require("express");
const router = express.Router();
const db = require('../config/db');

// หน้าแรก
router.get("/", (req, res) => {
  res.send("Hello from Node.js + Express!");
});

// Route 2_Admin_Menu
router.get('/admin-menu', (req, res) => {
  res.render('admin/2_Admin_Menu');
});

// Route 3_Data_Management
router.get('/data-management', async (req, res) => {
  try {
    const [vendorRows] = await db.promise().query(`
      SELECT COUNT(*) AS count
      FROM Sellers
      WHERE qualification_status = 2 OR srl_status IS NOT NULL
    `);
    const vendorCount = vendorRows[0].count;

    const [productRows] = await db.promise().query(`
      SELECT COUNT(*) AS count
      FROM Products
      WHERE pa_status = 2
    `);
    const productApprovalCount = productRows[0].count;

    res.render('admin/3_Data_Management', {
      vendorCount,
      productApprovalCount
    });

  } catch (error) {
    console.error('Error loading Data Management page:', error);
    res.status(500).send('Internal Server Error');
  }
});

// Route 3-2_Product_Approval
router.get('/product-approval', (req, res) => {
  const query = `
    SELECT 
      p.product_id AS productId,
      p.citizen_id AS citizenId,
      p.name AS productName,
      c.category_name AS category,
      p.created_at AS date
    FROM Products p
    JOIN Categories_Products cp ON cp.product_id = p.product_id
    JOIN Categories c ON c.category_id = cp.category_id
    WHERE p.pa_status = 2
  `;

  db.query(query, (err, results) => {
    if (err) {
      console.error('Error fetching products:', err);
      return res.status(500).send('Server error');
    }
    res.render('admin/3-2_Product_Approval', { products: results });
  });
});

// Route 3-2-1_View_Product_Approval
router.get('/3-2-1_View_Product_Approval.ejs', (req, res) => {
  const productId = req.query.id;

  const query = `
    SELECT 
      p.product_id AS id,
      p.name AS productName,
      p.citizen_id,
      p.image_url AS imageUrl,
      c.category_name AS category,
      p.price,
      p.stock_quantity AS quantity,
      p.description,
      s.store_name AS storeName
    FROM Products p
    JOIN Categories_Products cp ON cp.product_id = p.product_id
    JOIN Categories c ON c.category_id = cp.category_id
    JOIN Sellers s ON s.citizen_id = p.citizen_id
    WHERE p.product_id = ?
  `;

  db.query(query, [productId], (err, results) => {
    if (err || results.length === 0) {
      console.error('Error fetching product:', err);
      return res.status(404).send('Product not found');
    }
    res.render('admin/3-2-1_View_Product_Approval', { product: results[0] });
  });
});

// อนุมัติสินค้า
router.post('/product/:id/approve', (req, res) => {
  const productId = req.params.id;
  const query = 'UPDATE Products SET pa_status = 1 WHERE product_id = ?';

  db.query(query, [productId], (err) => {
    if (err) {
      console.error('Error approving product:', err);
      return res.status(500).send('Server error');
    }
    res.redirect('/product-approval');
  });
});

// ปฏิเสธสินค้า
router.post('/product/:id/reject', (req, res) => {
  const productId = req.params.id;
  const query = 'UPDATE Products SET pa_status = 0 WHERE product_id = ?';

  db.query(query, [productId], (err) => {
    if (err) {
      console.error('Error rejecting product:', err);
      return res.status(500).send('Server error');
    }
    res.redirect('/product-approval');
  });
});

// Route 4_Read_Only_Analyst
router.get('/read-only-analyst', (req, res) => {
  res.render('admin/4_Read_Only_Analyst');
});

// Route 4-3_Product_Approved
router.get('/product-approved', async (req, res) => {
  try {
    const query = `
      SELECT 
        p.product_id AS productId,
        p.name AS productName,
        p.citizen_id AS storeId,
        c.category_name AS category,
        p.updated_at AS date,
        p.pa_status AS status
      FROM Products p
      JOIN Categories_Products cp ON cp.product_id = p.product_id
      JOIN Categories c ON c.category_id = cp.category_id
      WHERE p.pa_status IN (0, 1)
    `;

    const [rows] = await db.promise().query(query);

    const productList = rows.map(product => {
      const dateObj = new Date(product.date);
      const formattedDate = `${dateObj.getDate().toString().padStart(2, '0')}/${(dateObj.getMonth() + 1).toString().padStart(2, '0')}/${dateObj.getFullYear()}`;
      const statusText = product.status === 1 ? 'approved' : 'rejected';

      return {
        ...product,
        dateFormatted: formattedDate,
        status: statusText
      };
    });

    res.render('admin/4-3_Product_Approved', { productList });

  } catch (error) {
    console.error('Error loading Product Approved page:', error);
    res.status(500).send('Internal Server Error');
  }
});

// Route 4-3-1_View_Product_Approved
router.get('/product-approved/:id', (req, res) => {
  const sourcePage = req.query.source || "fromProductApproved";
  const productId = req.params.id;

  const query = `
    SELECT 
      p.product_id AS id,
      p.name AS productName,
      p.citizen_id,
      p.image_url AS imageUrl,
      c.category_name AS category,
      p.price,
      p.stock_quantity AS quantity,
      p.description,
      s.store_name AS storeName
    FROM Products p
    JOIN Categories_Products cp ON cp.product_id = p.product_id
    JOIN Categories c ON c.category_id = cp.category_id
    JOIN Sellers s ON s.citizen_id = p.citizen_id
    WHERE p.product_id = ?
  `;

  db.query(query, [productId], (err, results) => {
    if (err || results.length === 0) {
      console.error('Error fetching product:', err);
      return res.status(404).send('Product not found');
    }

    res.render('admin/4-3-1_View_Product_Approved', {
      product: results[0],
      sourcePage
    });
  });
});

module.exports = router;
