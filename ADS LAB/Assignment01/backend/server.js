const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');

const app = express();
app.use(bodyParser.json());

const db = mysql.createConnection({
    host: 'localhost',
    user: '22510112',
    password: '22510112',
    database: 'db'
});

db.connect(err => {
    if (err) {
        throw err;
    } else {
        console.log('Connected to database');
    }
});

app.get('/api/tables', (req, res) => {
    connection.query('SHOW TABLES', (err, results) => {
      if (err) throw err;
      res.json(results);
    });
  });
  
  app.listen(3000, () => {
    console.log('Server running on port 3000');
  });