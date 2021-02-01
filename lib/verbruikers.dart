import 'package:flutter/material.dart';

class Verbruikers extends StatefulWidget {
  @override
  _VerbruikersState createState() => _VerbruikersState();
}

class _VerbruikersState extends State<Verbruikers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
