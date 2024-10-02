import 'package:flutter/material.dart';

class MedsView extends StatelessWidget {
  const MedsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: const Color(0xFF2D2F41),
      body: Center( // Center widget added here
        child: Text(
          "MEDS PAGE",
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
      ),
    );
  }
}