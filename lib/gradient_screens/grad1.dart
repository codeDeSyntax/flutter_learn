import 'package:flutter/material.dart';

class Grad1 extends StatelessWidget {
  const Grad1({super.key});

  @override
  Widget build(BuildContext context) {
    // gradient screen
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: SweepGradient(
                center: Alignment.center,
                colors: [
                  // Start color
                  Colors.grey[800]!, // Middle color
                  Colors.black,
                  Colors.grey.shade800,
                ],
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
