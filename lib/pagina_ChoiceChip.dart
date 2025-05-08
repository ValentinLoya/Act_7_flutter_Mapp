import 'package:flutter/material.dart';
import 'dart:math' as math;

class PantallaDos extends StatefulWidget {
  const PantallaDos({super.key});

  @override
  State<PantallaDos> createState() => _PantallaDosState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _PantallaDosState extends State<PantallaDos>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla Dos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TheWidget(controller: _controller),
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

class TheWidget extends AnimatedWidget {
  const TheWidget({
    Key? key,
    required AnimationController controller,
  }) : super(key: key, listenable: controller);

  Animation<double> get _progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _progress.value * 2.0 * math.pi,
      child: Container(
        width: 200.0,
        height: 200.0,
        color: Colors.green,
      ),
    );
  }
}
