const express = require('express');
const db = require('./queries.js');
const cors = require('cors');
const app = express();
const port = 3030;

app.use(cors());
app.use(express.json());
app.get('/',(req,res)=>res.json({info: 'working'}));
app.get('/:tableName',db.getData)
app.get('/:tableName/:id',db.getDataById)
app.post('/:tableName',db.addData)
app.listen(port, ()=>{
    console.log(`App is running on port ${port}`)
});