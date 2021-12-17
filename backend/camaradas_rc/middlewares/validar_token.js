const jwt = require('jsonwebtoken');

const validarToken = (req, res, next) => {

    
    const token = req.header('x-token');

    if(!token){
        res.status(401).json({
            ok:false,
            msg: 'No existe token en la peticion'
        });
    }

    try{

        const{uid} = jwt.verify(token,process.env.JWT_KEY);
        req.uid = uid        
        next();
    }
    catch(error){
        res.status(401).json( {
            ok:false,
            msg:'el token no e s válido'
        })
    }

}
module.exports = {
    validarToken
}