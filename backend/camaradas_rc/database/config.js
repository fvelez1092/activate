const mongoose = require('mongoose');

const dbConnection = async() => {
    try{
        await mongoose.connect(process.env.urlBD,{
            useNewUrlParser : true,
            useUnifiedTopology : true,

        });
        console.log('Db online');
    }
    catch(error){
        console.log(error);
        throw new Error('Error en la base de datos-Comunicarse con el Administrador'); 
    }
}
module.exports={
    dbConnection
}