import 'package:flutter/material.dart';

import 'package:chatappfirebase/widgets/Custome_ElevatedButton.dart';
import 'package:chatappfirebase/widgets/Custome_TextField.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/logo1.jpeg",
            height: 200,
            width: 200,
            fit: BoxFit.scaleDown,
          ),
          const Text("Login", style: TextStyle(fontSize: 30)),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Custome_TextField(
              hintText: "Email",
              labelText: "Email",
              prefixIcon: Icons.email,
            ),
          ),
          const Custome_ElevatedButton(
            text: "Login",
          )
        ],
      ),
    );
  }
}
