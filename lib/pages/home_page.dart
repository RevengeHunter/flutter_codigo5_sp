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
  initState() {
    super.initState();
    getData();
  }

  /*Obteniendo el valor de la funcion asincrona*/
  getData() async {
    nombre = await getName();
    setState(() {});

    // getName().then((value){
    //   nombre = value;
    //   setState(() {
    //
    //   });
    // });
  }

  /*Funcion Asincrona*/
  Future<String> getName() async {
    return Future.delayed(Duration(seconds: 3), () {
      return "Manolo Robles";
    });
  }

  Future<List<String>> getProducts() async {
    return Future.delayed(Duration(seconds: 3), () {
      return [
        "Corbatas",
        "Camisas",
        "Polos",
        "Sacos",
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: getName(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            print(snapshot.connectionState);
            print(snapshot.hasData);
            print(snapshot.data);

            if (snapshot.hasData) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "El cliente ${snapshot.data} tiene los siguientes productos:",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    FutureBuilder(
                      future: getProducts(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          List<String> lista = snapshot.data;
                          print(lista);
                          return ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: lista.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                title: Text(
                                  lista[index],
                                ),
                              );
                            },
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ],
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
