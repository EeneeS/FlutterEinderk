import 'dart:async';
import 'API.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class TotaleVerbruik extends StatefulWidget {
  @override
  _TotaleVerbruikState createState() => _TotaleVerbruikState();
}

class _TotaleVerbruikState extends State<TotaleVerbruik> {

  Timer timer;
  String _totaleVerbruik = 'No data';
  String url = 'http://192.168.0.124:5000/';
  var data;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (timer) => updateValue());
  }

  void updateValue() async {
    data = await getData(url);
    var decodedData = jsonDecode(data);
    setState(() {
      _totaleVerbruik = decodedData['vermogen'].toString();
    });
  }

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
