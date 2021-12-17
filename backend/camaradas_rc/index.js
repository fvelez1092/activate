const express = require('express');
const path = require('path');
require('dotenv').config();

//Db Configuracion
const{dbConnection} = require('./database/config');
dbConnection();

//App de express
const app = express();

//lectura y parseo del body

app.use(express.json());

//node server socket
const server = require('http').createServer(app);
module.exports.io = require('socket.io')(server);
require('./socket/socket');

const publicPath=path.resolve(__dirname,'public');
app.use(express.static(publicPath));

//Rutas
app.use('/api/login', require('./routes/auth.route'))


server.listen(process.env.PORT,(err)=>{
    if(err) throw new Error(err);
    console.log('Servidor corriendo en el puerto',process.env.PORT);
}
)