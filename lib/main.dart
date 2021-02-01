import 'package:flutter/material.dart';
import 'homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo KNX App',
      theme: ThemeData(primaryColor: Colors.blue),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final gebruikerController = TextEditingController();
  final wachtwoordController = TextEditingController();

  @override
  void dispose() {
    gebruikerController.dispose();
    wachtwoordController.dispose();
    super.dispose();
  }

  void verifyCredentials() {
    if (gebruikerController.text == 'admin' &&
        wachtwoordController.text == 'admin') {
      //Juiste gegevens ga naar menu pagina
      gebruikerController.clear();
      wachtwoordController.clear();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KNX APP'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 450,
          child: Column(
            children: [
              Text('Login', style: TextStyle(fontSize: 40, color: Colors.blue)),
              SizedBox(height: 50),
              TextField(
                controller: gebruikerController,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Gebruikersnaam'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: wachtwoordController,
                obscureText: true,
                autocorrect: false,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock), labelText: 'Wachtwoord'),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                  onPressed: verifyCredentials, child: Text('Aanmelden'))
            ],
          ),
        ),
      ),
    );
  }
}