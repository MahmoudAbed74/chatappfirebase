import 'package:flutter/material.dart';

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
            "assets/images/logo.png",
            fit: BoxFit.fill,
          ),
          Text("Login", style: TextStyle(fontSize: 30)),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "Enter Email",
                prefixIcon: Icon(Icons.email),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.amberAccent)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.green)),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Login",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red, // <-- Background color
            ),
          )
        ],
      ),
    );
  }
}
