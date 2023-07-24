const Pool = require('pg').Pool;
const pool = new Pool({
    user: 'postgres',
    host: 'travelapp.cpwlfcyouart.us-east-1.rds.amazonaws.com',
    database: 'travelapp',
    password: 'postgres',
    port: 5432,
});
const allowTables = [
    'destinations',
    'destinations_categories',
    'categories',
    'attractions',
    'destinations_attractions',
    'users',
    'saved_trips',
    'users_saved_trips',
    'attractions_trips',
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
    let {tableName, id} = req.params
    if(!allowTables.includes(tableName)){
        return res.status(404).send('Table Not Found')
    }
    if(tableName==='users') id = `'${id}'`
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
    pool.query(`SELECT * FROM users WHERE id = $1;`, [id])
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
    const {name, general_cost, destination_id, trip_id} = req.body
    pool.query(`SELECT * FROM attractions WHERE name = $1;`,[name])
        .then((results) => {
            if (results.rows.length) {
                res.status(200).json(results.rows)
                console.log(results.rows)
                pool.query(`INSERT INTO attractions_trips (id, attraction_id, trip_id) VALUES (DEFAULT, $1, $2) RETURNING *;`, [results.rows[0].id, trip_id])
                .then((results,error)=>{
                    if(error){
                        throw error;
                    }
                    res.status(200).json(results.rows)
                })
            } else {
                pool.query(`INSERT INTO attractions (id, name, general_cost, destination_id) VALUES (DEFAULT, $1, $2, $3) RETURNING *;`, [name,general_cost, destination_id])
                .then((results,error)=>{
                    if(error){
                        throw error;
                    }
                    res.status(200).json(results.rows)
                    pool.query(`INSERT INTO attractions_trips (id, attraction_id, trip_id) VALUES (DEFAULT, $1, $2) RETURNING *;`, [results.rows[0].id, trip_id])
                })
            }
        })
};

const getTripsAndAttractions = (req,res)=>{
    const {user_id} = req.params
    pool.query(`SELECT saved_trips.name, saved_trips.id as trip_id, destinations.id as destination_id, attractions.name as attraction, attractions.id as attraction_id, saved_trips.date, saved_trips.user_id FROM saved_trips JOIN attractions_trips ON attractions_trips.trip_id = saved_trips.id JOIN attractions ON attractions.id = attractions_trips.attraction_id JOIN destinations ON destinations.id = saved_trips.destination_id JOIN users_saved_trips ON users_saved_trips.user_id = saved_trips.user_id WHERE saved_trips.user_id = $1;`,[user_id])
    .then((results,error)=>{
        if(error){
            throw error;
        }
        res.status(200).json(results.rows)
    })
};

const getTripsByUserId = (req,res)=>{
    const {user_id} = req.params
    pool.query(`SELECT * FROM saved_trips WHERE user_id = $1;`,[user_id])
    .then((results,error)=>{
        if(error){
            throw error;
        }
        res.status(200).json(results.rows)
    })
};

const createTrip = (req,res)=>{
    const {user_id} = req.params

    const keys = Object.keys(req.body).join(', ')
    const values = Object.values(req.body)
    console.log(values)
    const psqlinsert = values.map((key,index)=>`$${index+1}`).join(', ')
    console.log(`INSERT INTO saved_trips (${keys}) VALUES (${psqlinsert}) RETURNING *;`)
    pool.query(`INSERT INTO saved_trips (${keys}) VALUES (${psqlinsert}) RETURNING *;`,
    values, (error, results)=>{
       if(error){
           throw error;
       }
       pool.query(`INSERT INTO users_saved_trips (id, trip_id, user_id) VALUES (DEFAULT, $1, $2) RETURNING *;`, [results.rows[0].id, user_id])
       res.status(200).json(results.rows)
    })

};

module.exports = {
    getData,
    getDataById,
    validateUser,
    addData,
    deleteData,
    updateData,
    addToTrip,
    getTripsAndAttractions,
    getTripsByUserId,
    createTrip
}