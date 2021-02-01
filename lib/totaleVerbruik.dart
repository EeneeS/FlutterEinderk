import 'package:flutter/material.dart';

class TotaleVerbruik extends StatefulWidget {
  @override
  _TotaleVerbruikState createState() => _TotaleVerbruikState();
}

class _TotaleVerbruikState extends State<TotaleVerbruik> {

  String _totaleVerbruik = 'No data';

  static const TextStyle optionsStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
          child: Text(
        'Totale Verbruik: ' + _totaleVerbruik + ' Watt',
        style: optionsStyle,
      )),
    );
  }
}
