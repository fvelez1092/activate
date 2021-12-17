const {Schema, model} = require('mongoose');

const UsuarioSchema = Schema({

    nombre : {
        type: String,
        required : true
    },
    correo : {
        type: String,
        required : true,
        unique : true
    },
    contrasena : {
        type: String,
        required : true,
    }
});

UsuarioSchema.method('toJSON',function(){
    const{__v, _id, contrasena,...object} = this.toObject();
    object.uid = _id;
    return object;
})
module.exports = model('Usuario', UsuarioSchema)