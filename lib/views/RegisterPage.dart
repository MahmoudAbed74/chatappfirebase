import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:chatappfirebase/constants.dart';
import 'package:chatappfirebase/widgets/Custome_ElevatedButton.dart';
import 'package:chatappfirebase/widgets/Custome_TextField.dart';

class ResisterPage extends StatelessWidget {
  ResisterPage({super.key});
  static String id_RegisterPage = "/register";
  String? email;
  String? password;
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
            Custome_TextField(
              onChanged: (data) {
                email = data;
              },
              hintText: "Email",
              labelText: "Email",
              prefixIcon: Icons.email,
            ),
            const SizedBox(
              height: 20,
            ),
            Custome_TextField(
              onChanged: (data) {
                password = data;
              },
              hintText: "password",
              labelText: "password",
              prefixIcon: Icons.lock,
            ),
            const SizedBox(
              height: 20,
            ),
            Custome_ElevatedButton(
              onPressed: () async {
                try {
                  final UserCredential credential = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                    email: email!,
                    password: password!,
                  );
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('The password provided is too weak.')));
                  } else if (e.code == 'email-already-in-use') {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            'The account already exists for that email.')));
                  } else if (e.code == 'invalid-email') {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('The email is badly formatted.')));
                  } else if (e.code == 'operation-not-allowed') {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Operation is not allowed.')));
                  } else if (e.code == 'user-disabled') {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('The user account has been disabled.')));
                  } else if (e.code == 'user-not-found') {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('The user does not exist.')));
                    print('The user does not exist.');
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(e.toString())));
                }
              },
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