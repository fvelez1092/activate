const {response} = require ('express');
const bcrypt = require ('bcryptjs');

const Usuario = require ('../models/usuario');
const {generarJwt} = require ('../helpers/jwt');



const login = async (req, res = response) => {
    const{email, contrasena}=req.body;
    
    try{

        const usuarioDB = await Usuario.findOne({email});

        if(!usuarioDB){

            res.status(400).json({
                ok: false,
                msg : 'El usuario no existe'
            })

        }

        const validContrasena = bcrypt.compareSync(contrasena, usuarioDB.contrasena);

        if(!validContrasena){

            res.status(400).json({
                ok: false,
                msg : 'Contraseña incorrecta'
            })

        }
 
        const token = await generarJwt(usuarioDB.id);

        res.json({
            ok: true,
            msg : ' Usuario loggeado correctamente',
            token
        })
    }

    catch(error){
        console.log(error);
        res.status(500).json({
            ok: false,
            msg : ' Consulte con el administrador'
        })
    }

}


const crearUsuario = async (req, res = response) => {
    
    const{correo, contrasena}=req.body;
    
    try{

        const existeEmail = await Usuario.findOne({correo});

        if(existeEmail){

            res.status(400).json({
                ok: false,
                msg : ' Correo duplicado'
            })

        }

        const usuario = new Usuario(req.body);

        //encryptamiento de la contraseña
        const salt = bcrypt.genSaltSync();
        usuario.contrasena = bcrypt.hashSync(contrasena, salt);


        await usuario.save();    
        
        const token = await generarJwt(usuario.id);
        console.log(usuario.id);

        res.json({
            ok: true,
            usuario,
            token
        })
    }

    catch(error){
        console.log(error);
        res.status(500).json({
            ok: false,
            msg : ' Consulte con el administrador'
        })
    }
}

const renovarToken = async (req, res = response) => {

    const uid = req.uid;

    const token = await generarJwt( uid );

    const usuario = await Usuario.findById(uid);

    res.json({
        ok: true,
        token,
        usuario,
        msg : ' Token renovado correctamente'
    })
}

module.exports = {
    crearUsuario,
    login,
    renovarToken
}