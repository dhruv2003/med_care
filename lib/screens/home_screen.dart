import 'package:flutter/material.dart';
import 'package:med_care/screens/clock_view.dart';
import 'package:med_care/screens/meds_page.dart';
import 'package:med_care/screens/account_page.dart';
import 'package:animations/animations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPageIndex = 0;

  final List<Widget> _pages = [
    const ClockView(), // Removed Center here
    const MedsView(),
    const MyAccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D2F41),
      body: PageTransitionSwitcher(
        transitionBuilder: (child, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        child: _currentPageIndex == 0
            ? Center(child: _pages[_currentPageIndex]) // Centering ClockView here
            : _pages[_currentPageIndex],
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(color: Colors.white), // Set label text color to white
          ),
        ),
        child: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
          selectedIndex: _currentPageIndex,
          backgroundColor: const Color(0xFF2D2F41),
          destinations: <NavigationDestination>[
            NavigationDestination(
              icon: Icon(
                Icons.home,
                color: _currentPageIndex == 0 ? Colors.blue : Colors.white,
              ),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.medication_outlined,
                color: _currentPageIndex == 1 ? Colors.blue : Colors.white,
              ),
              label: 'MEDS'
            ),
            NavigationDestination(
              icon: Icon(
                Icons.person,
                color: _currentPageIndex == 2 ? Colors.blue : Colors.white,
              ),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}