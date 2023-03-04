import 'package:flutter/material.dart';
import 'package:krify_test_task/thank_u_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Hi Krify! Welcome to My Screen',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                child: Text('Get Started'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ThankYouScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                elevation: 4,
                padding: EdgeInsets.all(16),
                primary: Color.fromARGB(103, 169, 27, 235),
                onPrimary: Color.fromARGB(255, 255, 254, 254),
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
