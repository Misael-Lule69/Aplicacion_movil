import 'package:flutter/material.dart';
import 'package:practica_flutter/login.dart';

class inicio extends StatefulWidget {
  const inicio({super.key});

  @override
  State<inicio> createState() => _iniciostate();
}

class _iniciostate extends State<inicio> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 5),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => login()),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(66, 224, 9, 9),
      /*
      appBar: AppBar(
        title: Text("APPBAR", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.amber,
      ),*/
      body: Center(
        child: Container(
          child: Column(
            children: [
              Image.asset("asset/img/goku.jpg", width: 200, height: 200),
              Text("Cargando...", style: TextStyle(fontFamily: "Burgundia")),
              Container(
                width: 200,
                child: LinearProgressIndicator(
                  minHeight: 10.0,
                  backgroundColor: Colors.blueAccent,
                  valueColor: AlwaysStoppedAnimation(Colors.amber),
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
          width: 300,
          height: 500,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 20,
                offset: Offset(10, 10),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.red),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.room_service),
            label: "Servicios",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.production_quantity_limits),
            label: "Productos",
          ),
        ],
      ),
    );
  }
}
