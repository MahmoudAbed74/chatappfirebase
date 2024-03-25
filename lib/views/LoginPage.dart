import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:chatappfirebase/constants.dart';
import 'package:chatappfirebase/helper/ShowSnackBar.dart';
import 'package:chatappfirebase/views/RegisterPage.dart';
import 'package:chatappfirebase/widgets/Custome_ElevatedButton.dart';
import 'package:chatappfirebase/widgets/Custome_TextField.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static String id_LoginPage = "/login";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

String? email;

String? password;

bool isLoading = false;

GlobalKey<FormState> formKey = GlobalKey<FormState>();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPramiryColor,
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Padding(
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
                  if (formKey.currentState!.validate()) {
                    isLoading = true;
                    setState(() {});
                    try {
                      await loginEmailAndPassword();
                      showSnackBar(context,
                          message: "Account created successfully");
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        showSnackBar(context,
                            message: 'The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        showSnackBar(context,
                            message:
                                'The account already exists for that email.');
                      } else if (e.code == 'invalid-email') {
                        showSnackBar(context,
                            message: 'The email address is badly formatted.');
                      } else if (e.code == 'operation-not-allowed') {
                        // ignore: use_build_context_synchronously
                        showSnackBar(context,
                            message: 'Operation not allowed.');
                      } else if (e.code == 'user-disabled') {
                        showSnackBar(context,
                            message: 'The user account has been disabled.');
                      } else if (e.code == 'user-not-found') {
                        showSnackBar(context,
                            message: 'No user found for that email.');
                      }
                    } catch (e) {
                      showSnackBar(context, message: e.toString());
                    }
                  }
                  isLoading = false;
                  setState(() {});
                },
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
                      Navigator.pushNamed(
                          context, ResisterPage.id_RegisterPage);
                    },
                    child:
                        const Text("Sign Up", style: TextStyle(fontSize: 15)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loginEmailAndPassword() async {
    final UserCredential credential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
