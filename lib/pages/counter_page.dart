import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {

  @override
  initState() {
    super.initState();
    _getDataFull();
  }

  int _counter = 0;

  _saveData() async{
    SharedPreferences prefers = await SharedPreferences.getInstance();
    prefers.setInt("count", _counter);
  }

  _getDataFull() async{
    SharedPreferences prefers = await SharedPreferences.getInstance();
    _counter = prefers.getInt("count") ?? 0;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
           _counter++;
           _saveData();
          setState(() {

          });
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _counter.toString(),
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            Text(
              "Presiona el botón para subir el contador!",
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
