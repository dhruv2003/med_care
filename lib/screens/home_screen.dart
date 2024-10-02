import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:med_care/screens/clock_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: const Color(0xFF2D2F41),
        child: const ClockView(),
      ),
    );
  }
}