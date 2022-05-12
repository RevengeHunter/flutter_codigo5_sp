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

  Future<int> getNumberMandarina() async {
    return Future.delayed(Duration(seconds: 3), () {
      return 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text("Home"),
      ),
      drawer: Drawer(
        elevation: 1,
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://images.pexels.com/photos/1762973/pexels-photo-1762973.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                ),
              ),
              child: Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 40.0,
                          foregroundImage: NetworkImage(
                            "https://images.pexels.com/photos/320014/pexels-photo-320014.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          "Pedro Catbell",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          "Administrador",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white70,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("My Profile"),
            ),
            ListTile(
              leading: Icon(Icons.file_copy),
              title: Text("Portfolio"),
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text("Change Password"),
            ),
            Divider(thickness: 0.6,indent: 22,endIndent: 22,),
            ListTile(
              leading: Icon(Icons.exit_to_app,),
              title: Text("Log Out"),
            ),
          ],
        ),
      ),
    );
  }
}
