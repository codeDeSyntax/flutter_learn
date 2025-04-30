import 'package:flutter/material.dart';

class Grad3 extends StatelessWidget {
  const Grad3({super.key});

  @override
  Widget build(BuildContext context) {
    // gradient screen
    return Scaffold(
      body: Stack(
        children: [
          Container(
            // color: Colors.amber,
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(1.0, -0.1),
                radius: 1.0,
                colors: [Color(0xFFE8701A), Color(0xFF0E0E0E)],
                focal: Alignment(1, -5),
              ),
            ),
          ),
          Center(
            child: Text(
              'Gradient Screen 1',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
    // return const Placeholder();
  }
}
