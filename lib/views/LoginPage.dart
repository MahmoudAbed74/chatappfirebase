import 'package:flutter/material.dart';

import 'package:chatappfirebase/constants.dart';
import 'package:chatappfirebase/views/RegisterPage.dart';
import 'package:chatappfirebase/widgets/Custome_ElevatedButton.dart';
import 'package:chatappfirebase/widgets/Custome_TextField.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static String id_LoginPage = "/login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPramiryColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 100,
            ),
            Image.asset(
              "assets/images/logo1.jpeg",
              height: 200,
              width: 200,
              fit: BoxFit.scaleDown,
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Login", style: TextStyle(fontSize: 30)),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Custome_TextField(
              hintText: "Email",
              labelText: "Email",
              prefixIcon: Icons.email,
            ),
            const SizedBox(
              height: 20,
            ),
            const Custome_TextField(
              hintText: "password",
              labelText: "password",
              prefixIcon: Icons.lock,
            ),
            const SizedBox(
              height: 20,
            ),
            const Custome_ElevatedButton(
              text: "Login",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ResisterPage.id_RegisterPage);
                  },
                  child: const Text("Sign Up", style: TextStyle(fontSize: 15)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
