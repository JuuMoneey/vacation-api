const Pool = require('pg').Pool;
const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'travelapp',
    password: 'postgres',
    port: 5432,
});
const allowTables = [
    'user',
    'past_trips',
    'saved_trips',
    'trips',
    'itinerary',
    'destinations',
    'attractions',
    'lodging',
    'match',
    'photos',
    'user_photos',
    'comments',
    'seasons',
    'weather',
    'categories'
]

const getData = (req,res)=>{
    const {tableName} = req.params
    if(!allowTables.includes(tableName)){
        return res.status(404).send('Table Not Found')
    }
    pool.query(`SELECT * FROM ${tableName};`)
    .then((error, results)=>{
        if(error){
            throw error;
        }
        res.status(200).json(results.rows)
    });
};

const getDataById = (req,res)=>{
    const {tableName, id} = req.params
    if(!allowTables.includes(tableName)){
        return res.status(404).send('Item Not Found')
    }
    pool.query(`SELECT * FROM ${tableName} WHERE id = ${id};`)
    .then((error,results)=>{
        if(error){
            throw error;
        }
        res.status(200).json(results.rows)
    })
}

const addData = (req,res)=>{
    const {tableName} = req.params
    if(!allowTables.includes(tableName)){
        return res.status(404).send('Item Not Found')
    }
    const keys = Object.keys(req.body).join(', ')
    const values = Object.values(req.body)
    const psqlinsert = values.map((key,index)=>`$${index+1}`).join(', ')
    console.log(`INSERT INTO ${tableName} (${keys}) VALUES (${psqlinsert}) RETURNING *;`)
    pool.query(`INSERT INTO ${tableName} (${keys}) VALUES (${psqlinsert}) RETURNING *;`,
    values, (error,results)=>{
        if(error){
            throw error;
        }
        res.status(200).json(results.rows)
    })
};

const deleteData = (req,res)=>{
    const {tableName,id} = req.params
    if(!allowTables.includes(tableName)){
        return res.status(404).send('Item Not Found')
    }
    pool.query(`DELETE FROM ${tableName} WHERE id = ${id};`)
    .then((error,results)=>{
        if(error){
            throw error;
        }
        res.status(200).json(results.rows)
    });
};

const updateData = (req,res)=>{
    const {tableName,id} = req.params
    if(!allowTables.includes(tableName)){
        return res.status(404).send('Item Not Found')
    }
    const update = req.body
    const set = Object.entries(set).map(([column,value])=>`${column} = ${value}`).join(', ')
    pool.query(`UPDATE ${tableName} SET ${set} WHERE id = ${id};`)
    .then((error,results)=>{
        if(error){
            throw error;
        }
        res.status(200).json(results.rows)
    });
};

module.exports = {
    getData,
    getDataById,
    addData,
    deleteData,
    updateData
}