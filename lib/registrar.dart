import 'package:flutter/material.dart';

class registrar extends StatefulWidget {
  const registrar({super.key});

  @override
  State<registrar> createState() => _registrarState();
}

class _registrarState extends State<registrar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("asset/img/goku.jpg", width: 200, height: 200),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Nombre de usuario",
                prefixIcon: Icon(Icons.person),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Correo electrónico",
                prefixIcon: Icon(Icons.email),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Contraseña",
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.visibility_off_outlined),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
