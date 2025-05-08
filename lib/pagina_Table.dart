import 'package:flutter/material.dart'; // Importamos Material for ElevatedButton

class PantallaCinco extends StatelessWidget {
  const PantallaCinco({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla Cinco'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.orangeAccent,
              alignment: Alignment.center,
              child: const Text('Flutter Mapp'),
              constraints: const BoxConstraints.expand(height: 200),
              transform: Matrix4.rotationZ(0.2),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Regresar!'),
            ),
          ],
        ),
      ),
    );
  }
}
