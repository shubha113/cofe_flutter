import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../screens/dashboard_screen.dart';
import '../screens/devices_screen.dart';
import '../screens/routine_screen.dart';
import '../screens/stats_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const DevicesScreen(),
    const RoutineScreen(),
    const StatsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppConstants.primaryBlue,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone_android_outlined),
            activeIcon: Icon(Icons.phone_android),
            label: "Devices",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.repeat_on_outlined),
            activeIcon: Icon(Icons.repeat_on),
            label: 'Routine',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined),
            activeIcon: Icon(Icons.bar_chart),
            label: "Stats",
          ),
        ],
      ),
    );
  }
}
