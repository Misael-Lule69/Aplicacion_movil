import 'package:flutter/material.dart';
import 'package:practica_flutter/login.dart';
import 'package:practica_flutter/registrar.dart';
import 'package:practica_flutter/salir.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data"),
        backgroundColor: Colors.blue[800],
        centerTitle: true,
        elevation: 10,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[200],
        elevation: 20,
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("asset/img/goku.jpg"),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.phone, size: 18, color: Colors.white),
                      SizedBox(width: 5),
                      Text(
                        "(729) 968 3892",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.email, size: 18, color: Colors.white),
                      SizedBox(width: 5),
                      Text(
                        "Misaellule123@gmail.com",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.blue),
              title: const Text(
                "Inicio",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
              },
              tileColor: Colors.grey[100],
            ),
            ListTile(
              leading: const Icon(Icons.login, color: Colors.blue),
              title: const Text(
                "Login",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const login()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.app_registration, color: Colors.blue),
              title: const Text(
                "Registro",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const registrar()),
                );
              },
            ),
            const Divider(thickness: 1, color: Colors.grey),
            ListTile(
              leading: const Icon(Icons.exit_to_app, color: Colors.red),
              title: const Text(
                "Salir",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Salir()),
                );
              },
              tileColor: Colors.grey[100],
            ),
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.grey[100],
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _buildProductCard(),
                            _buildProductCard(),
                            _buildProductCard(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.blue[800],
                        child: const Center(
                          child: Text(
                            "Sección Azul",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.green[800],
                        child: const Center(
                          child: Text(
                            "Sección Verde",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildProductCard() {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withAlpha(50),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              "asset/img/goku.jpg",
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              "\$1,200.00",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.blue[800],
              side: BorderSide(color: Colors.blue[800]!),
              padding: const EdgeInsets.symmetric(horizontal: 30),
            ),
            child: const Text("Comprar"),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
