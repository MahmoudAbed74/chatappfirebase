import 'package:flutter/material.dart';

import 'package:chatappfirebase/constants.dart';
import 'package:chatappfirebase/widgets/Custome_ElevatedButton.dart';
import 'package:chatappfirebase/widgets/Custome_TextField.dart';

class ResisterPage extends StatelessWidget {
  const ResisterPage({super.key});
  static String id_RegisterPage = "/register";
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
                Text("Register", style: TextStyle(fontSize: 30)),
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
                  "I have an account?",
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Login", style: TextStyle(fontSize: 15)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
