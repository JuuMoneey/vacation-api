const express = require('express');
const db = require('./queries.js');
const cors = require('cors');
const app = express();
const port = 3030;

app.use(cors());
app.use(express.json());
app.get('/',(req,res)=>res.json({info: 'working'}));
app.get('/getTrips/:user_id', db.getTripsAndAttractions)
app.get('/getTripsByUserId/:user_id', db.getTripsByUserId)
app.get('/:tableName',db.getData)
app.get('/:tableName/:id',db.getDataById)
app.post('/login/:id',db.validateUser)
app.post('/trip', db.addToTrip)
app.post('/:tableName',db.addData)
app.post('/createTrip/:user_id',db.createTrip)
app.delete('/:tableName/:id',db.deleteData)
app.put('/:tableName/:id',db.updateData)
app.listen(port, ()=>{
    console.log(`App is running on port ${port}`)
});