require('dotenv').config();
const express = require('express');
const mysql = require('mysql');
const cors = require('cors');

const app = express();
const PORT = process.env.PORT || 5000;

// Middleware
app.use(cors());
app.use(express.json());

// Database Connection
const db = mysql.createConnection({
    host: 'localhost',
    user: '22510112', // Change if needed
    password: '22510112', // Change if needed
    database: 'db',
    port: 3306
});

db.connect(err => {
    if (err) {
        console.error('Database connection failed:', err);
        return;
    }
    console.log('Connected to MySQL Database');
});

// Routes

// Get all users
app.get('/users', (req, res) => {
    db.query('SELECT * FROM users', (err, result) => {
        if (err) {
            return res.status(500).send(err);
        }
        res.json(result);
    });
});

// Add a new user
app.post('/users', (req, res) => {
    const { name } = req.body;
    db.query('INSERT INTO users (name) VALUES (?)', [name], (err, result) => {
        if (err) {
            return res.status(500).send(err);
        }
        res.json({ message: 'User added', id: result.insertId });
    });
});

// Start Server
app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});
