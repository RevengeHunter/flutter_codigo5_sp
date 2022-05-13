import 'package:flutter/material.dart';
import 'package:flutter_codigo5_sp/pages/profile_page.dart';
import 'package:flutter_codigo5_sp/utils/sp_global.dart';

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
    // getData();
    _getDataFull();
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

  TextEditingController _txtFullName = TextEditingController();
  TextEditingController _txtAddress = TextEditingController();

  bool darkMode = false;
  int valueGender = 1;

  SPGlobal spGlobal = SPGlobal();

  String fullNameSaved = "";
  String fullAddressSaved = "";

  _saveData() {
    // SharedPreferences prefers = await SharedPreferences.getInstance();
    // prefers.setString("name", _txtFullName.text);
    // prefers.setString("address", _txtAddress.text);
    // prefers.setBool("darkMode", darkMode);
    // prefers.setInt("gender", valueGender);

    spGlobal.fullName = _txtFullName.text;
    spGlobal.address = _txtAddress.text;
    spGlobal.darkMode = darkMode;
    spGlobal.gender = valueGender;

    //6setState(() {});
  }

  _getDataFull() {
    // SharedPreferences prefers = await SharedPreferences.getInstance();
    // _txtFullName.text = prefers.getString("name") ?? '-';
    // _txtAddress.text = prefers.getString("address") ?? '-';
    // fullNameSaved = prefers.getString("name") ?? '-';
    // fullAddressSaved = prefers.getString("address") ?? '-';
    // darkMode = prefers.getBool("darkMode") ?? true;
    // valueGender = prefers.getInt("gender") ?? 1;

    _txtFullName.text = spGlobal.fullName;
    _txtAddress.text = spGlobal.address;

    setState(() {});
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
                      spGlobal.fullName,
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
                      spGlobal.address,
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
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfilePage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.file_copy),
              title: Text("Portfolio"),
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text("Change Password"),
            ),
            Divider(
              thickness: 0.6,
              indent: 22,
              endIndent: 22,
            ),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
              ),
              title: Text("Log Out"),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Settings",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff424242),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: _txtFullName,
                decoration: InputDecoration(
                  hintText: "Full Name",
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: _txtAddress,
                decoration: InputDecoration(hintText: "Address"),
              ),
              const SizedBox(
                height: 20.0,
              ),
              // Switch(
              //   value: true,
              //   onChanged: (bool value) {},
              // ),
              SwitchListTile(
                title: Text(
                  "Dark Mode",
                ),
                value: darkMode,
                onChanged: (bool value) {
                  darkMode = value;
                  setState(() {});
                },
              ),
              /*En el radio el value y el groupValue debe coincidir*/
              // Radio(
              //   value: 2,
              //   groupValue: 1,
              //   onChanged: (value) {
              //     print(value.toString());
              //   },
              // ),
              Text("Gender",style: TextStyle(fontSize: 18.0,),),
              RadioListTile(
                title: Text("Male",),
                value: 1,
                groupValue: valueGender,
                onChanged: (int? value) {
                  valueGender = value!;
                  setState(() {

                  });
                },
              ),
              RadioListTile(
                title: Text("Female",),
                value: 2,
                groupValue: valueGender,
                onChanged: (int? value) {
                  valueGender = value!;
                  setState(() {

                  });
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.save),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    primary: Colors.black87,
                  ),
                  onPressed: () {
                    _saveData();
                    print("guardando");
                    setState(() {});
                  },
                  label: const Text(
                    "Save Data",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
