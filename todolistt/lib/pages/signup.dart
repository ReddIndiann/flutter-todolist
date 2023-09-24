import 'package:flutter/material.dart';
import 'package:todolistt/pages/homepage.dart';

import '../reusable_widget.dart/reusable_widget.dart';

import '../utilty/colors.dart';

class signupPage extends StatefulWidget {
  const signupPage({super.key});

  @override
  State<signupPage> createState() => _signupPageState();
}

class _signupPageState extends State<signupPage> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Sign Up',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("images/white.png"),
                const SizedBox(
                  height: 20,
                ),
                resuableTextField("Enter UserName", Icons.person_outline, false,
                    _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                resuableTextField('Enter Email Id', Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                resuableTextField('Enter Password', Icons.lock, true,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                signinSignUpButton(context, false, () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return homepage();
                  }));
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
