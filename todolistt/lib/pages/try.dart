import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:todolistt/models/user_models.dart';
import 'package:todolistt/pages/addlist.dart';

import '../reusable_widget.dart/reusable_widget.dart';
import 'config.dart';

class tryful extends StatefulWidget {
  const tryful({Key? key}) : super(key: key);

  @override
  State<tryful> createState() => _tryfulState();
}

class _tryfulState extends State<tryful> {
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
      appBar: AppBar(title: Text('TO DO LIST')),
      body: SafeArea(
        child: LayoutBuilder(builder: (context, size) {
          return ValueListenableBuilder<Box<UserModel>>(
            valueListenable: LocalDB.userBox.listenable(),
            builder: (context, box, child) {
              var users = box.values.toList();
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.blue,
                    margin: EdgeInsets.all(3),
                    elevation: 3,
                    child: ListTile(
                        title: Text(
                          users[index].activityname,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          children: [
                            Row(
                              children: [
                                Text('Start time:'),
                                Text(users[index].starttime),
                              ],
                            ),
                            Row(
                              children: [
                                Text('End time:'),
                                Text(users[index].endtime),
                              ],
                            ),
                          ],
                        ),
                        trailing: SizedBox(
                            width: 100,
                            child: SizedBox(
                              width: 100,
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      activitynameController.text =
                                          users[index].activityname;
                                      starttimeController.text =
                                          users[index].starttime;
                                      endtimeController.text =
                                          users[index].endtime;

                                      showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              color: Colors.white,
                                              height: 200,
                                              width: size.maxWidth,
                                              child: Column(children: [
                                                //idNumber textfeild
                                                resuableTexttodo(
                                                    "activity title",
                                                    Icons.local_activity,
                                                    false,
                                                    activitynameController),

                                                TextField(
                                                  controller:
                                                      starttimeController,
                                                  decoration: InputDecoration(
                                                    prefixIcon: Icon(
                                                      Icons.access_time,
                                                      color: Colors.white70,
                                                    ),
                                                    labelText: "StartingTime",
                                                    filled: true,
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .never,
                                                    fillColor: Colors.white
                                                        .withOpacity(0.3),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                      borderSide: BorderSide(
                                                          width: 0,
                                                          style:
                                                              BorderStyle.none),
                                                    ),
                                                  ),
                                                  onTap: () async {
                                                    TimeOfDay? pickedTime =
                                                        await showTimePicker(
                                                      context: context,
                                                      initialTime:
                                                          TimeOfDay.now(),
                                                    );

                                                    if (pickedTime != null) {
                                                      setState(() {
                                                        starttimeController
                                                                .text =
                                                            pickedTime.format(
                                                                context);
                                                      });
                                                    }
                                                  },
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
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .never,
                                                    fillColor: Colors.white
                                                        .withOpacity(0.3),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                      borderSide: BorderSide(
                                                          width: 0,
                                                          style:
                                                              BorderStyle.none),
                                                    ),
                                                  ),
                                                  onTap: () async {
                                                    TimeOfDay? pickedTime =
                                                        await showTimePicker(
                                                      context: context,
                                                      initialTime:
                                                          TimeOfDay.now(),
                                                    );

                                                    if (pickedTime != null) {
                                                      setState(() {
                                                        endtimeController.text =
                                                            pickedTime.format(
                                                                context);
                                                      });
                                                    }
                                                  },
                                                ),

                                                ElevatedButton(
                                                    onPressed: () {
                                                      users[index].UpdateUser(
                                                        activityname:
                                                            activitynameController
                                                                .text,
                                                        starttime:
                                                            starttimeController
                                                                .text,
                                                        endtime:
                                                            endtimeController
                                                                .text,
                                                      );
                                                      users[index].UpdateUser();
                                                    },
                                                    child: Text("Update"))
                                              ]),
                                            );
                                          });
                                    }, ///////////////////////////////////
                                    icon: Icon(Icons.edit),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                                title: Text("Delete items"),
                                                content: Text(
                                                    "Are you sure y0u want to delete"),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text("NO")),
                                                  TextButton(
                                                      onPressed: () {
                                                        users[index]
                                                            .deleteUser();
                                                      },
                                                      child: Text("YES"))
                                                ]);
                                          });
                                    },
                                  ),
                                ],
                              ),
                            ))),
                  );
                },
              );
            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return toTo();
          }));
        },
      ),
    );
  }
}
