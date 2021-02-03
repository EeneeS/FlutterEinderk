import 'package:flutter/material.dart';
import 'API.dart';

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
              ElevatedButton(onPressed: () => getData('http://192.168.0.208:5000/verbruiker1Aan'), child: Text('Verbruiker 1: aan')),
              ElevatedButton(onPressed: () => getData('http://192.168.0.208:5000/verbruiker1Uit'), child: Text('Verbruiker 1: uit'))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () => getData('http://192.168.0.208:5000/verbruiker2Aan'), child: Text('Verbruiker 2: aan')),
              ElevatedButton(onPressed: () => getData('http://192.168.0.208:5000/verbruiker2Uit'), child: Text('Verbruiker 2: uit'))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () => getData('http://192.168.0.208:5000/verbruiker3Aan'), child: Text('Verbruiker 3: aan')),
              ElevatedButton(onPressed: () => getData('http://192.168.0.208:5000/verbruiker3Uit'), child: Text('Verbruiker 3: uit'))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () => getData('http://192.168.0.208:5000/verbruiker4Aan'), child: Text('Verbruiker 4: aan')),
              ElevatedButton(onPressed: () => getData('http://192.168.0.208:5000/verbruiker4Uit'), child: Text('Verbruiker 4: uit'))
            ],
          )
        ],
      ),
    );
  }
}
