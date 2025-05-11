const express = require("express");
const cors = require("cors");
const path = require('path');
const db = require('./config/db'); // Import DB connection
const vendorRoutes = require('./routes/vendor');

const app = express();
app.use(express.json());
app.use(cors());
app.use(express.urlencoded({ extended: true }));

// ตั้งค่าให้ serve static จากโฟลเดอร์ public ของ frontend
app.use(express.static(path.join(__dirname, '..', 'frontend', 'public')));

// ตั้งค่า EJS
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, '..', 'frontend', 'views'));



app.get("/", (req, res) => {
  res.send("Hello from Node.js + Express!");
});

/*
//เชื่อม Route ให้แสดงผล EJS ทั้งหมด ใน views/admin
<<<<<<< Updated upstream
//app.get('/admin/:page', (req, res) => {
//  const page = req.params.page;
//  res.render(`admin/${page}`);
//});
=======
app.get('/admin/:page', (req, res) => {
  const page = req.params.page;
  res.render(`admin/${page}`);
});
*/

// Route 2_Admin_Menu
app.get('/admin/2_Admin_Menu', (req, res) => {
  res.render('admin/2_Admin_Menu'); // เปลี่ยนชื่อ 'data-management' ตามไฟล์ EJS ของคุณ
});

// Route 3_Data_Management
app.get('/admin/3_Data_Management', async (req, res) => {
  try {
    // นับจำนวน vendor ตามเงื่อนไข: qualification_status = 2 OR srl_status IS NOT NULL
    const [vendorRows] = await db.promise().query(`
      SELECT COUNT(*) AS count
      FROM Sellers
      WHERE qualification_status = 2 OR srl_status IS NOT NULL
    `);
    const vendorCount = vendorRows[0].count;

    // นับจำนวน product ที่รออนุมัติ (pa_status = 2)
    const [productRows] = await db.promise().query(`
      SELECT COUNT(*) AS count
      FROM Products
      WHERE pa_status = 2
    `);
    const productApprovalCount = productRows[0].count;

    // ส่งตัวแปรไปให้ EJS
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
app.get('/admin/3-2_Product_Approval', (req, res) => {
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
app.get('/admin/3-2-1_View_Product_Approval', (req, res) => {
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

app.post('/product/:id/approve', (req, res) => {
  const productId = req.params.id;
  const query = 'UPDATE Products SET pa_status = 1 WHERE product_id = ?';
  db.query(query, [productId], (err) => {
    if (err) {
      console.error('Error approving product:', err);
      return res.status(500).send('Server error');
    }
    res.redirect('/admin/3-2_Product_Approval');
  });
});

app.post('/product/:id/reject', (req, res) => {
  const productId = req.params.id;
  const query = 'UPDATE Products SET pa_status = 0 WHERE product_id = ?';
  db.query(query, [productId], (err) => {
    if (err) {
      console.error('Error rejecting product:', err);
      return res.status(500).send('Server error');
    }
    res.redirect('/admin/3-2_Product_Approval');
  });
});

// Route 4_Read_Only_Analyst
app.get('/admin/4_Read_Only_Analyst', (req, res) => {
  res.render('admin/4_Read_Only_Analyst'); // เปลี่ยนชื่อ 'data-management' ตามไฟล์ EJS ของคุณ
});

// Route 4-3_Product_Approved
app.get('/admin/4-3_Product_Approved', async (req, res) => {
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

    // แปลงข้อมูล
    const productList = rows.map(product => {
      // แปลงวันที่เป็น dd/mm/yyyy
      const dateObj = new Date(product.date);
      const day = String(dateObj.getDate()).padStart(2, '0');
      const month = String(dateObj.getMonth() + 1).padStart(2, '0');
      const year = dateObj.getFullYear();
      const formattedDate = `${day}/${month}/${year}`;

      // แปลงสถานะเป็นข้อความ
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
app.get('/admin/4-3-1_View_Product_Approved', (req, res) => {
  const productId = req.query.id;
  const sourcePage = req.query.source || "fromProductApproved"; // <-- เพิ่มตรงนี้

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
      sourcePage: sourcePage // <-- ส่งค่าเข้า EJS
    });
  });
});

>>>>>>> Stashed changes

// Use the vendor routes
app.use('/', vendorRoutes);

// เริ่มเซิร์ฟเวอร์
const PORT = 8000;
app.listen(PORT, () => {
  console.log(`🚀 Server running on http://localhost:${PORT}`);
});
