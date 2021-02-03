import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class TotaleVerbruik extends StatefulWidget {
  @override
  _TotaleVerbruikState createState() => _TotaleVerbruikState();
}

class _TotaleVerbruikState extends State<TotaleVerbruik> {
  MqttClient client;
  var topic = 'servicelocation/91d9dff3-dee8-4316-af61-dafd26172dd9/realtime';
  String _totaleVerbruik = 'No data';

  Future<MqttClient> connect() async {
    MqttServerClient client = MqttServerClient.withPort(
        'broker.mqttdashboard.com', 'flutter_client', 1883);
    client.logging(on: true);
    client.onConnected = onConnected;
    client.onDisconnected = onDisconnected;
    client.onUnsubscribed = onUnsubscribed;
    client.onSubscribed = onSubscribed;
    client.onSubscribeFail = onSubscribeFail;
    client.pongCallback = pong;

    final connMess = MqttConnectMessage()
        .withClientIdentifier("flutter_client")
        .authenticateAs("test", "test")
        .keepAliveFor(60)
        .withWillTopic(
            'servicelocation/91d9dff3-dee8-4316-af61-dafd26172dd9/realtime')
        .withWillMessage('App connected!')
        .startClean()
        .withWillQos(MqttQos.atLeastOnce);
    client.connectionMessage = connMess;
    try {
      print('Connecting');
      await client.connect();
    } catch (e) {
      client.disconnect();
    }

    if (client.connectionStatus.state == MqttConnectionState.connected) {
      print('EMQX client connected');
      client.updates.listen((List<MqttReceivedMessage<MqttMessage>> c) {
        final MqttPublishMessage message = c[0].payload;
        String payload =
            MqttPublishPayload.bytesToStringAsString(message.payload.message);
        getData(payload);
      });

      client.published.listen((MqttPublishMessage message) {});
    } else {
      client.disconnect();
      exit(-1);
    }

    return client;
  }

  void onConnected() {
    print('Connected');
  }

  void onDisconnected() {
    //print('Disconnected');
  }

  void onSubscribed(String topic) {
    print('Subscribed topic: $topic');
  }

  void onSubscribeFail(String topic) {
    //print('Failed to subscribe topic: $topic');
  }

  void onUnsubscribed(String topic) {
    //print('Unsubscribed topic: $topic');
  }

  void pong() {
    //print('Ping response client callback invoked');
  }

  @override
  void initState() {
    super.initState();
    connect().then((value) {
      client = value;
    });
  }

  void getData(payload) {
    setState(() {
      Map data = jsonDecode(payload);
      _totaleVerbruik = data["totalPower"].toString() + ' Watt';
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Totale Verbruik: ' + _totaleVerbruik,
                style: optionsStyle,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: Text('Subscribe'),
                      onPressed: () {
                        return {client?.subscribe(topic, MqttQos.atLeastOnce)};
                      },
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      child: Text('Unsubscribe'),
                      onPressed: () {
                        {client?.unsubscribe(topic);}
                        setState(() {
                          _totaleVerbruik = 'No Data';
                        });
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
