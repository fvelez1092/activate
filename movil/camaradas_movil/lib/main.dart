import 'package:camaradas_rc_movil/routes/routes.dart';
import 'package:camaradas_rc_movil/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthService(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'login',
        routes: appRoutes,
        home: Scaffold(
          appBar: AppBar(
            title: Text('Ronny Baduy App HC4'),
          ),
          body: Center(
            child: Container(
              child: Text('Ronny Baduy App HC4'),
            ),
          ),
        ),
      ),
    );
  }
}
