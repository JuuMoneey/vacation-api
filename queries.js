const Pool = require('pg').Pool;
const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'traveldb10',
    password: 'iamttyller',
    port: 5432,
});
const allowTables = [
    'destinations',
    'destinations_categories',
    'categories',
    'seasons',
    'destinations_seasons',
    'weather',
    'destinations_weather',
    'photos',
    'destinations_photos',
    'attractions',
    'attractions_photos',
    'destinations_attractions',
    'lodging',
    'lodging_photos',
    'destinations_lodging',
    'users',
    'itinerary',
    'past_trips',
    'users_past_trips',
    'saved_trips',
    'users_saved_trips',
    'user_photos',
    'comments',
]

const getData = (req,res)=>{
    const {tableName} = req.params
    if(!allowTables.includes(tableName)){
        return res.status(404).send('Table Not Found')
    }
    pool.query(`SELECT * FROM ${tableName};`)
    .then((results,error)=>{
        if(error){
            throw error;
        }
        res.status(200).json(results.rows)
    });
};

const getDataById = (req,res)=>{
    const {tableName, id} = req.params
    if(!allowTables.includes(tableName)){
        return res.status(404).send('Table Not Found')
    }
    pool.query(`SELECT * FROM ${tableName} WHERE id = ${id};`)
    .then((results,error)=>{
        if(error){
            throw error;
        }
        res.status(200).json(results.rows)
    })
}


const addData = (req,res)=>{
    const {tableName} = req.params
    if(!allowTables.includes(tableName)){
        return res.status(404).send('Table Not Found')
    }
    const keys = Object.keys(req.body).join(', ')
    const values = Object.values(req.body)
    console.log(values)
    const psqlinsert = values.map((key,index)=>`$${index+1}`).join(', ')
    console.log(`INSERT INTO ${tableName} (${keys}) VALUES (${psqlinsert}) RETURNING *;`)
    pool.query(`INSERT INTO ${tableName} (${keys}) VALUES (${psqlinsert}) RETURNING *;`,
    values, (error, results)=>{
       if(error){
           throw error;
       }
       res.status(200).json(results.rows)
    })
};

const validateUser = (req, res) => {
    const { id } = req.params;
    pool.query(`SELECT * FROM users WHERE google_id = $1;`, [id])
        .then((results) => {
            if (results.rows.length) {
                res.status(200).json(results.rows)
            } else {
                const keys = Object.keys(req.body).join(', ');
                const values = Object.values(req.body);
                const psqlinsert = values.map((_, index) => `$${index + 1}`).join(', ');

                pool
                    .query(`INSERT INTO users (${keys}) VALUES (${psqlinsert}) RETURNING *;`, values)
                    .then((results) => {
                        res.status(200).json(results.rows);
                    })
                    .catch((error) => {
                        throw error;
                    });
            }
        })
        .catch((error) => {
            throw error;
        });
};

const deleteData = (req,res)=>{
    const {tableName,id} = req.params
    if(!allowTables.includes(tableName)){
        return res.status(404).send('Table Not Found')
    }
    pool.query(`DELETE FROM ${tableName} WHERE id = ${id};`)
    .then((results,error)=>{
        if(error){
            throw error;
        }
        res.status(200).json(results.rows)
    });
};

const updateData = (req,res)=>{
    const {tableName,id} = req.params
    if(!allowTables.includes(tableName)){
        return res.status(404).send('Table Not Found')
    }
    const set = Object.entries(req.body).map(([column,value])=>`${column} = '${value}'`).join(', ')
    pool.query(`UPDATE ${tableName} SET ${set} WHERE id = $1 RETURNING *;`,[id])
    .then((results)=>{
        res.status(200).json(results.rows)
    })
    .catch((error)=>{
        console.error('Error updating data', error)
        res.status(500).send('Error updating data')
    });
};

const addToTrip = (req,res)=>{
    const {name, generalCost, destinationId, tripId} = req.params
    pool.query(`SELECT * FROM attractions WHERE name = ${name};`)
        .then((results) => {
            if (results.rows.length) {
                res.status(200).json(results.rows)
                pool.query(`INSERT INTO attractions_trips (id, attraction_id, trip_id) VALUES (DEFAULT, ${results.id}, ${tripId}) RETURNING *;`)
            } else {
                pool.query(`INSERT INTO attractions (id, name, general_cost, destination_id) VALUES (DEFAULT, ${name}, ${generalCost}, ${destinationId}) RETURNING *;`)
                .then((results,error)=>{
                    if(error){
                        throw error;
                    }
                    res.status(200).json(results.rows)
                    pool.query(`INSERT INTO attractions_trips (id, attraction_id, trip_id) VALUES (DEFAULT, ${results.id}, ${tripId}) RETURNING *;`)
                })
            }
        })
}

module.exports = {
    getData,
    getDataById,
    validateUser,
    addData,
    deleteData,
    updateData,
    addToTrip
}