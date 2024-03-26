import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dashboard.dart';
import 'loginform.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDQ4DvUVrImtjKhrGa9rXPGvRX-S1Fr-BQ",
            authDomain: "auth-dc425.firebaseapp.com",
            projectId: "auth-dc425",
            storageBucket: "auth-dc425.appspot.com",
            messagingSenderId: "514815880781",
            appId: "1:514815880781:web:bc77c1791cc8be1b0ab604",
            measurementId: "G-7GK3S2DE35"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Login',
      theme: ThemeData(
        primaryColor: Color(0xFF1877F2), // Facebook Meta Blue
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginForm(),
        '/dashboard': (context) => Dashboard(),
      },
    );
  }
}
