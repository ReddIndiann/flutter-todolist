import 'package:flutter/material.dart';
import 'package:todolistt/pages/homepage.dart';
import 'package:todolistt/pages/signup.dart';
import '../reusable_widget.dart/reusable_widget.dart';
import '../utilty/colors.dart';

class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  TextEditingController passWordTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                SizedBox(
                  height: 30,
                ),
                resuableTextField('Enter Username', Icons.person_2_outlined,
                    false, emailTextController),
                SizedBox(
                  height: 30,
                ),
                resuableTextField(
                    'Enter Password', Icons.lock, true, passWordTextController),
                SizedBox(
                  height: 20,
                ),
                signinSignUpButton(context, true, () {
                  Navigator.push(
                      context,
                      (MaterialPageRoute(builder: (context) {
                        return homepage();
                      })));
                }),
                SignUpOption()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row SignUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Dont Have an Account?',
          style: TextStyle(color: Colors.white70),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return signupPage();
              }),
            );
          },
          child: Text(
            'Sign up',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
