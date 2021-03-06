import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/sp_global.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  initState() {
    super.initState();
    _getDataFull();
  }

  SPGlobal spGlobal = SPGlobal();

  String _txtFullName = "";
  String _txtAddress = "";
  bool _bolDarkThema = false;
  int _gender = 1;
  Color barColor = Colors.pinkAccent;
  Color fontColor = Colors.white;
  String genero = "Male";

  _getDataFull(){
    // SharedPreferences prefers = await SharedPreferences.getInstance();
    // _txtFullName = prefers.getString("name") ?? '-';
    // _txtAddress = prefers.getString("address") ?? '-';
    // _bolDarkThema = prefers.getBool("darkMode") ?? true;
    // (_bolDarkThema == true)
    //     ? barColor = Colors.black38
    //     : barColor = Colors.pinkAccent;
    // _gender = prefers.getInt("gender") ?? 1;
    // (_gender == 1) ? genero = "Male" : genero = "Female";

    _txtFullName = spGlobal.fullName;
    _txtAddress = spGlobal.address;
    _bolDarkThema = spGlobal.darkMode;
    (_bolDarkThema == true)
        ? barColor = Colors.black38
        : barColor = Colors.pinkAccent;
    _gender = spGlobal.gender;
    (_gender == 1) ? genero = "Male" : genero = "Female";

    setState(() {});
  }

  Future<String> getDataTest() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("name") ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: (spGlobal.darkMode== true) ? barColor = Colors.black38 : barColor = Colors.pinkAccent,
        title: Text(
          "Profile",
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 10.0,
          ),
          margin: EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 20.0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: (spGlobal.darkMode== true) ? barColor = Colors.black38 : barColor = Colors.pinkAccent,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(
                  Icons.person,
                  color: fontColor,
                ),
                title: Text(
                  spGlobal.fullName,
                  style: TextStyle(
                    color: fontColor,
                  ),
                ),
                subtitle: Text(
                  "FullName",
                  style: GoogleFonts.notoSans(
                    fontSize: 15.0,
                    color: fontColor,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.location_on,
                  color: fontColor,
                ),
                title: Text(
                  spGlobal.address,
                  style: TextStyle(
                    color: fontColor,
                  ),
                ),
                subtitle: Text(
                  "Address",
                  style: GoogleFonts.notoSans(
                    fontSize: 15.0,
                    color: fontColor,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.dark_mode,
                  color: fontColor,
                ),
                title: Text(
                  (spGlobal.darkMode == true) ? "On" : "Off",
                  style: TextStyle(
                    color: fontColor,
                  ),
                ),
                subtitle: Text(
                  "Dark mode",
                  style: GoogleFonts.notoSans(
                    fontSize: 15.0,
                    color: fontColor,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.people,
                  color: fontColor,
                ),
                title: Text(
                  (spGlobal.gender == 1) ? "Male" : "Female",
                  style: TextStyle(
                    color: fontColor,
                  ),
                ),
                subtitle: Text(
                  "Gender",
                  style: GoogleFonts.notoSans(
                    fontSize: 15.0,
                    color: fontColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // body: FutureBuilder(
      //   future: getDataTest(),
      //   builder: (BuildContext context, AsyncSnapshot snap){
      //     if(snap.hasData){
      //       return Center(child: Text(snap.data),);
      //     }
      //     return Center(
      //       child: Text("Cargando"),
      //     );
      //   },
      // ),
    );
  }
}
