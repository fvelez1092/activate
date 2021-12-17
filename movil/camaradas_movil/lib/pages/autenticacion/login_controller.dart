import 'package:camaradas_rc_movil/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:camaradas_rc_movil/utils/snackbar.dart' as utils;
import 'package:provider/provider.dart';

class LoginController {
  BuildContext? context;
  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();

  TextEditingController emailController = new TextEditingController();
  TextEditingController contrasenaController = new TextEditingController();

  late AuthService _authService;

  Future? init(BuildContext context) {
    this.context = context;
    _authService = Provider.of<AuthService>(context, listen: false);
  }

  void login() async {
    String correo = emailController.text.trim();
    String contrasena = contrasenaController.text.trim();
    _authService.login(correo, contrasena);
    //try {
    //bool isLogin = await _authService.login(email, contrasena);
    //if (isLogin) {
    // Navigator.pushNamed(context!, 'home');
    // } else {
    // utils.Snackbar.showSnackbar(
    //  context!, key, 'Usuario y/o contraseñas incorrectos');
    //print("Usuario y/o contraseñas incorrectos");
    //    }
    // } catch (error) {
    //   print('Error: $error');
    //  }
  }
}
