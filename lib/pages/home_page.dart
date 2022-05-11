import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String nombre = "No hay nombre";

  /*Se utiliza el initState ya que es necesario para consumir la funcion
  * asincrona*/
  @override
  initState(){
    super.initState();
    getData();
  }

  /*Obteniendo el valor de la funcion asincrona*/
  getData() async{
    nombre = await getName();
    setState(() {

    });

    // getName().then((value){
    //   nombre = value;
    //   setState(() {
    //
    //   });
    // });
  }

  /*Funcion Asincrona*/
  Future<String> getName() async {
    return Future.delayed(Duration(seconds: 3),(){
      return "Manolo Robles";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(nombre,),
      ),
    );
  }
}