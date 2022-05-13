import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo5_sp/pages/counter_page.dart';
import 'package:flutter_codigo5_sp/pages/home_page.dart';
import 'package:flutter_codigo5_sp/utils/sp_global.dart';

void main() async{
  /*Se utiliza para interactuar con el motor de flutter
  * se esta utilizando para el SPGlobal*/
  WidgetsFlutterBinding.ensureInitialized();
  SPGlobal prefs = SPGlobal();
  await prefs.initShared();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
