import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:chatappfirebase/views/LoginPage.dart';
import 'package:chatappfirebase/views/RegisterPage.dart';
import 'package:chatappfirebase/views/chatPage.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => ResisterPage(),
        "/chat": (context) => ChatPage(),
      },
      initialRoute: '/chat',
    );
  }
}
