const {Router} = require('express');
const {check} = require('express-validator');

const {crearUsuario, login, renovarToken} = require('../controllers/auth.controller');
const {validarCampos} = require('../middlewares/validar_campos');
const {validarToken} = require('../middlewares/validar_token');

const router = Router();

router.post('/registro',[
    check('nombre','El nombre es obligatorio').not().isEmpty(),
    check('contrasena','Lacontrasena es obligatoria').not().isEmpty(),
    check('correo','El nombre es obligatorio').isEmail(),
    validarCampos 
],crearUsuario),

router.post('/',[
    check('correo','El correo es obligatorio').not().isEmpty(),
    check('contrasena','Lacontrasena es obligatoria').not().isEmpty(),
    validarCampos 
],login),

router.get('/renovar',validarToken,renovarToken)



module.exports = router;