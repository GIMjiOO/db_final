require("dotenv").config();
const express = require("express");
const mysql = require("mysql2");
const cors = require("cors");

const app = express();
app.use(express.json());
app.use(cors());

const db = mysql.createConnection({
  host: process.env.DB_HOST || "localhost",
  user: process.env.DB_ROOT_USER || "root",
  password: process.env.DB_PASSWORD || "1234",
  database: process.env.DB_NAME || "final_project",
});

db.connect((err) => {
  if (err) {
    console.error("❌ Database connection failed:", err);
  } else {
    console.log("✅ Connected to MySQL database!");
  }
});

app.get("/", (req, res) => {
  res.send("Hello from Node.js + Express!");
});

app.get("/api/data", (req, res) => {
  db.query("SELECT 'Hello from MySQL!' AS message", (err, results) => {
    if (err) {
      res.status(500).json({ error: err.message });
    } else {
      res.json(results[0]);
    }
  });
});

const PORT = 8000;
app.listen(PORT, () => {
  console.log(`🚀 Server running on http://localhost:${PORT}`);
});
