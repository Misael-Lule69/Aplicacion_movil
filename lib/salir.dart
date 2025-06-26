import 'package:practica_flutter/login.dart'; // Asegúrate de importar tu página de login
import 'package:flutter/material.dart';

class Salir extends StatelessWidget {
  const Salir({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cerrar Sesión'),
        automaticallyImplyLeading: false, // Oculta el botón de retroceso
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.exit_to_app, size: 80, color: Colors.red),
            const SizedBox(height: 20),
            const Text(
              '¿Volver a iniciar sesión?',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                  ),
                  onPressed: () {
                    // Navegar de vuelta al login
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const login()),
                      (Route<dynamic> route) =>
                          false, // Elimina todas las rutas anteriores
                    );
                  },
                  child: const Text('Sí'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                  ),
                  onPressed: () {
                    // Cerrar la aplicación completamente
                    // Nota: Esto no funciona en iOS por restricciones de la plataforma
                    // SystemNavigator.pop();
                    // Alternativa para mostrar un mensaje
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('La aplicación permanecerá abierta'),
                      ),
                    );
                  },
                  child: const Text('No'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
