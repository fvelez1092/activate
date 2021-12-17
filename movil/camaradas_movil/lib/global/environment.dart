import 'dart:io';

class Environment {
  static String apiUrl =
      Platform.isAndroid ? 'http://10.0.2.2:5000/api' : 'http://localhost:5000';

  static String socketUrl =
      Platform.isAndroid ? 'http://10.0.2.2:5000/api' : 'http://localhost:5000';
}
