import 'package:flutter/material.dart';
import 'verbruikers.dart';
import 'totaleVerbruik.dart';
import 'monitor.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> _screenList = [
    TotaleVerbruik(),
    Verbruikers(),
    Monitor()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenList.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.flash_on), label: 'Verbruikers'),
        BottomNavigationBarItem(icon: Icon(Icons.monitor), label: 'Monitor'),
      ], currentIndex: _selectedIndex, onTap: _onItemTapped),
    );
  }
}
