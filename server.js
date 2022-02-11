'use strict';
const express = require('express');
// Constants
const PORT = 80;
const HOST = '0.0.0.0';
// App
const app = express();
app.get('/', (req, res) => {
res.send('<h1 style="color:green;">This is first ECS Service deployment by Rahul Singh</h1> \n');
});
app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);