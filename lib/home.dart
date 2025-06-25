import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:practica_flutter/login.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Data")),
      drawer: Drawer(
        backgroundColor: Colors.grey,
        elevation: 20,
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  ClipOval(
                    child: Image.asset(
                      "asset/img/goku.jpg",
                      width: 50,
                      height: 50,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.phone, size: 13),
                      Text("(729)9683892)", style: TextStyle(fontSize: 15)),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  Row(
                    children: [
                      Icon(Icons.email, size: 13),
                      Text(
                        "Misaellule123@gmail.com",
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Incio"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.login),
              title: Text("Login"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.app_registration),
              title: Text("Registro"),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Salir"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => login()),
                );
              },
            ),
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (context, Constraints) {
          return Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.black,
                        child: ListView(
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  Image.asset(
                                    "asset/img/goku.jpg",
                                    width: 200,
                                    height: 200,
                                  ),
                                  Text("\$1,200.00"),
                                  OutlinedButton(
                                    onPressed: () {},
                                    child: Text("Comprar"),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Image.asset(
                                    "asset/img/goku.jpg",
                                    width: 200,
                                    height: 200,
                                  ),
                                  Text("\$1,200.00"),
                                  OutlinedButton(
                                    onPressed: () {},
                                    child: Text("Comprar"),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Image.asset(
                                    "asset/img/goku.jpg",
                                    width: 200,
                                    height: 200,
                                  ),
                                  Text("\$1,200.00"),
                                  OutlinedButton(
                                    onPressed: () {},
                                    child: Text("Comprar"),
                                  ),
                                ],
                              ),
                            ),
                          ],
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(child: Container(color: Colors.blue)),
                    Expanded(child: Container(color: Colors.green)),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
