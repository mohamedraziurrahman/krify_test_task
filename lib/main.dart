import 'package:flutter/material.dart';
import 'package:krify_test_task/hi_page.dart';
import 'package:krify_test_task/signuppage.dart';
import 'forgotpassword.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;
  String? _passwordErrorText;

  bool _validatePassword(String password) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return regex.hasMatch(password);
  }

  final _formKey = GlobalKey<FormState>();
  late String _email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 20.0),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Email Address',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email address';
                } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                    .hasMatch(value)) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
              onSaved: (value) => _email = value!,
            ),
            SizedBox(height: 20.0),
            TextField(
              obscureText: _isObscure,
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                      _isObscure ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
              ),
              onChanged: (value) {
                if (_validatePassword(value)) {
                  setState(() {
                    _passwordErrorText = null;
                  });
                } else {
                  setState(() {
                    _passwordErrorText =
                        'Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one digit, and one special character.';
                  });
                }
              },
            ),
            SizedBox(height: 10.0),
            if (_passwordErrorText != null)
              Text(
                _passwordErrorText!,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 12.0,
                ),
              ),
            SizedBox(height: 20.0),
            ElevatedButton(
              child: Text('Login'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()),
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
            ElevatedButton(
              child: Text('Forgot Password?'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ForgotPasswordScreen()),
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
            ElevatedButton(
              child: Text('Sign Up'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupPage()),
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
    );
  }
}
