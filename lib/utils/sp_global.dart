import 'package:shared_preferences/shared_preferences.dart';

class SPGlobal{

  /*Se invoca al mismo construcctor al iniciar la calse*/
  static final SPGlobal _instance = SPGlobal._spGlobalInstance();

  SPGlobal._spGlobalInstance();

  /*Se usa factory para inpedir la creacion de instancias fuera de esta clase*/
  factory SPGlobal(){
    return _instance;
  }

  /*Confia que luego se va a realizar dicha asigancion*/
  late SharedPreferences _spGlobalPrefs;

  Future<void> initShared() async{
    _spGlobalPrefs = await SharedPreferences.getInstance();
  }

  //Guardar datos
  set fullName(String value){
    _spGlobalPrefs.setString("fullName", value);
  }

  String get fullName{
    /*Como puede ser null se usa ??*/
    return _spGlobalPrefs.getString("fullName") ?? "";
  }

}