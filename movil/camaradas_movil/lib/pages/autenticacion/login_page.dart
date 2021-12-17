import 'package:camaradas_rc_movil/pages/autenticacion/login_controller.dart';
import 'package:camaradas_rc_movil/widgets/boton_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:camaradas_rc_movil/utils/colores.dart' as utils;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController _con = new LoginController();
  late bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.key,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _imagen(),
            _textfielEmail(),
            _textfielContrasena(),
            _logginButton(),
            _recuperarContrasena()
          ],
        ),
      ),
    );
  }

  Widget _logginButton() {
    return BotonApp(
      texto: "Iniciar Sesion",
      onPressedFunction: _con.login,
      color: utils.Colores.primario,
    );
  }

  Widget _textfielEmail() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: _con.emailController,
        decoration: const InputDecoration(
          fillColor: utils.Colores.primario,
          hintText: "correo@cacicustech.com",
          labelText: "E-mail",
          labelStyle: TextStyle(color: utils.Colores.primario),
          suffixIcon: Icon(Icons.email_outlined, color: Colors.black),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: utils.Colores.primario),
          ),
        ),
      ),
    );
  }

  Widget _textfielContrasena() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: TextField(
          obscureText: _passwordVisible,
          controller: _con.contrasenaController,
          decoration: InputDecoration(
            hintText: "Contraseña",
            labelText: "Contraseña",
            labelStyle: TextStyle(color: utils.Colores.primario),
            suffixIcon: IconButton(
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.black,
                ),
                onPressed: () {
                  setState(() => _passwordVisible = !_passwordVisible);
                }),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: utils.Colores.primario),
            ),
          ),
        ));
  }

  Widget _recuperarContrasena() {
    return GestureDetector(
      onTap: () {
        print('pantalla de recuperacion');
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: const Text("Olvidaste tu contraseña?",
            style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 15,
                color: Colors.black)),
      ),
    );
  }

  Widget _imagen() {
    return Container(
      width: 320.0,
      height: 320.0,
      decoration: BoxDecoration(
          color: utils.Colores.primario,
          shape: BoxShape.circle,
          border: Border.all(color: utils.Colores.primario, width: 5.0),
          image: const DecorationImage(
              scale: 60,
              fit: BoxFit.contain,
              image: AssetImage('assets/imagenes/Logo-R5.png'))),
      margin: const EdgeInsets.all(50),
    );
  }
}
