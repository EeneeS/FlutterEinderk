import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const TextStyle optionsStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static List<Widget> _screenList = [
    //Home screen
    Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
          child: Text(
        'Totale Vermogen: ',
        style: optionsStyle,
      )),
    ),
    //Verbuikers screen
    Scaffold(
      appBar: AppBar(
        title: Text('Verbruikers'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: null, child: Text('Verbruiker 1: aan')),
              ElevatedButton(onPressed: null, child: Text('Verbruiker 1: uit'))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: null, child: Text('Verbruiker 2: aan')),
              ElevatedButton(onPressed: null, child: Text('Verbruiker 2: uit'))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: null, child: Text('Verbruiker 3: aan')),
              ElevatedButton(onPressed: null, child: Text('Verbruiker 3: uit'))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: null, child: Text('Verbruiker 4: aan')),
              ElevatedButton(onPressed: null, child: Text('Verbruiker 4: uit'))
            ],
          )
        ],
      ),
    ),
    //Monitor screen
    Scaffold(
      appBar: AppBar(
        title: Text('Monitor'),
      ),
    ),
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
