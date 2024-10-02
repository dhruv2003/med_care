import 'package:flutter/material.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: const Color(0xFF2D2F41),
      body: Center( // Center widget added here
        child: Text(
          "ACCOUNT PAGE",
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
      ),
    );
  }
}