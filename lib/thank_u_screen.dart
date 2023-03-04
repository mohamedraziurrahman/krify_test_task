import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:krify_test_task/main.dart';

class ThankYouScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Thank You!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Have a Great Day!',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              child: Text('Close'),
              onPressed: () {
                SystemNavigator.pop();
                // Navigator.pop(context,
                // MaterialPageRoute(builder: (context) => LoginPage()));
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
    );
  }
}
