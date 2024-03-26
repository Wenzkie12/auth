import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  TextEditingController _errors = TextEditingController();

  bool _showSignUpForm = false;

  // Function for signing up
  Future<void> _signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );
      // Sign up success, move to dashboard
      Navigator.pushReplacementNamed(context, '/dashboard');
    } on FirebaseAuthException catch (e) {
      _errors.text = '$e';
    } catch (e) {
      _errors.text = '$e';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'The Night Circus',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF4267B2), // Facebook Meta Blue Color
      ),
      backgroundColor: Colors.transparent, // Transparent background
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 141, 182, 244),
              Color.fromARGB(255, 255, 255, 255),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Welcome to the Domain of Clowns',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              SizedBox(
                width: 500,
                height: 50,
                child: TextField(
                  controller: _email,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r'[^a-zA-Z0-9.@]')),
                  ],
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 500,
                height: 50,
                child: TextField(
                  controller: _password,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _showSignUpForm ? _signUp : _signIn,
                child: Text(_showSignUpForm ? 'Sign up' : 'Login'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF4267B2), // Facebook Meta Blue Color
                  onPrimary: Color.fromARGB(255, 242, 243, 244),
                ),
              ),
              SizedBox(height: 8.0),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _showSignUpForm = !_showSignUpForm;
                  });
                },
                child: Text(
                  _showSignUpForm ? 'Login' : 'Sign up',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4267B2), // Facebook Meta Blue Color
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              TextField(
                controller: _errors,
                enabled: false,
                decoration: InputDecoration(
                  labelText: 'Error',
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(color: Color.fromARGB(255, 137, 5, 214)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function for signing in
  Future<void> _signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );
      // Sign in success, move to dashboard
      Navigator.pushReplacementNamed(context, '/dashboard');
    } on FirebaseAuthException catch (e) {
      _errors.text = '$e';
    } catch (e) {
      _errors.text = '$e';
    }
  }
}
