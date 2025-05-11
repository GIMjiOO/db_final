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


//เชื่อม Route ให้แสดงผล EJS ทั้งหมด ใน views/admin
//app.get('/admin/:page', (req, res) => {
//  const page = req.params.page;
//  res.render(`admin/${page}`);
//});

// Use the vendor routes
app.use('/', vendorRoutes);

// เริ่มเซิร์ฟเวอร์
const PORT = 8000;
app.listen(PORT, () => {
  console.log(`🚀 Server running on http://localhost:${PORT}`);
});
