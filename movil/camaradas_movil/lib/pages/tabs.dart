import 'package:flutter/material.dart';
import 'package:camaradas_rc_movil/utils/colores.dart' as utils;

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;

  final List _pageList = [
    // Primero ponga todas las páginas en la colección List
    //BusquedaPage(),
    //RegistroPage(),
    //VehiculoPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: _drawer(),
        appBar: AppBar(
            actions: [
              Image.asset('assets/imagenes/Logo-R5.png'),
            ],
            backgroundColor: utils.Colores.primario,
            title: Text("Convencion Nacional 2021")),
        body: _pageList[_currentIndex],
        bottomNavigationBar: _navigation());
  }

  Widget _drawer() {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              children: [
                Container(
                    child: Text('Convencion Nacional Manabi 2021',
                        style: TextStyle(color: utils.Colores.primario))),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/imagenes/Logo-R5.png'),
                  radius: 60,
                )
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text('Registro',
                  style: TextStyle(color: utils.Colores.primario))),
          Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text('Buscar',
                  style: TextStyle(color: utils.Colores.primario))),
          Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text('Vehiculos',
                  style: TextStyle(color: utils.Colores.primario))),
          Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text('Cerrar Sesion',
                  style: TextStyle(color: utils.Colores.primario))),
        ],
      ),
    );
  }

  Widget _navigation() {
    return BottomNavigationBar(
        currentIndex:
            _currentIndex, // Configure el valor de índice correspondiente para seleccionar
        onTap: (int index) {
          setState(() {
            //Cambian de estado
            _currentIndex =
                index; // Cambiar las coordenadas de la pestaña seleccionada
          });
        },
        iconSize: 25, // Tamaño del icono, el valor predeterminado es 20
        fixedColor: utils.Colores
            .primario, // El color seleccionado, el predeterminado es azul
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
          BottomNavigationBarItem(
              icon: Icon(Icons.app_registration), label: 'Registro'),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'Vehiculo',
          ),

          // BottomNavigationBarItem(
          //   icon:Icon(Icons.settings),
          // label: 'Resumen'
          //),
        ]);
  }
}
