import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:todolistt/models/user_models.dart';
import 'package:todolistt/pages/homepage.dart';
import 'package:todolistt/pages/try.dart';

import '../reusable_widget.dart/reusable_widget.dart';

class toTo extends StatefulWidget {
  const toTo({super.key});

  @override
  State<toTo> createState() => _toToState();
}

class _toToState extends State<toTo> {
  TextEditingController activitynameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController starttimeController = TextEditingController();
  TextEditingController endtimeController = TextEditingController();
  TextEditingController priorityController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('add content')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            resuableTexttodo("activity title", Icons.local_activity, false,
                activitynameController),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: dateController,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.calendar_today_rounded,
                    color: Colors.white70,
                  ),
                  labelText: "date",
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: Colors.white.withOpacity(0.3),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide:
                          BorderSide(width: 0, style: BorderStyle.none))),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101));

                if (pickedDate != null) {
                  setState(() {
                    dateController.text =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                  });
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: starttimeController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.access_time,
                  color: Colors.white70,
                ),
                labelText: "StartingTime",
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                fillColor: Colors.white.withOpacity(0.3),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(width: 0, style: BorderStyle.none),
                ),
              ),
              onTap: () async {
                TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );

                if (pickedTime != null) {
                  setState(() {
                    starttimeController.text = pickedTime.format(context);
                  });
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: endtimeController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.access_time,
                  color: Colors.white70,
                ),
                labelText: "ending Time",
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                fillColor: Colors.white.withOpacity(0.3),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(width: 0, style: BorderStyle.none),
                ),
              ),
              onTap: () async {
                TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );

                if (pickedTime != null) {
                  setState(() {
                    endtimeController.text = pickedTime.format(context);
                  });
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                var Content = UserModel(
                    id: Random().nextInt(1000).toString(),
                    activityname: activitynameController.text,
                    starttime: starttimeController.text,
                    endtime: endtimeController.text,
                    email: emailController.text,
                    password: passwordController.text);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return homepage();
                }));
                Content.saveUser();
              },
              child: Text("ADD"),
              style: ButtonStyle(
                  padding: MaterialStatePropertyAll(
                      EdgeInsets.fromLTRB(60, 20, 60, 20))),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black54,
    );
  }
}
