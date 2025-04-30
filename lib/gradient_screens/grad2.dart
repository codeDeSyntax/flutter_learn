import 'package:flutter/material.dart';

class Grad2 extends StatelessWidget {
  const Grad2({super.key});

  @override
  Widget build(BuildContext context) {
    // gradient screen
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF00F260), Color(0xFF0575E6)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
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
