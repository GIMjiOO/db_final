const express = require("express");
const cors = require("cors");
const path = require('path');
const db = require('./config/db'); // Import DB connection

const app = express();
app.use(express.json());
app.use(cors());

// ตั้งค่าให้ serve static จากโฟลเดอร์ public ของ frontend
app.use(express.static(path.join(__dirname, '..', 'frontend', 'public')));

// ตั้งค่า EJS
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, '..', 'frontend', 'views'));



app.get("/", (req, res) => {
  res.send("Hello from Node.js + Express!");
});

// Route หลักที่ใช้ EJS
app.get('/admin/login', (req, res) => {
  res.render('admin/1_Login'); // ส่ง render ไฟล์ views/admin/1_Login.ejs
});

// เริ่มเซิร์ฟเวอร์
const PORT = 8000;
app.listen(PORT, () => {
  console.log(`🚀 Server running on http://localhost:${PORT}`);
});
