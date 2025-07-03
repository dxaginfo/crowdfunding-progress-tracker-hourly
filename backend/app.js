const express = require('express');
const app = express();
app.use(express.json());
app.get('/', (req, res) => res.send('Crowdfunding Progress Tracker API'));
module.exports = app;
