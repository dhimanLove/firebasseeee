//This Fille have the code for my Student's Record Database Project

import 'package:firebasseeee/Service/Databasee.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebasseeee/Files/Employee.dart';
//import 'package:firebasseeee/Service/Database.dart';
import 'package:firebasseeee/Student%20Attendence/Student.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homee extends StatefulWidget {
  const Homee({super.key});

  @override
  State<Homee> createState() => _HomeeState();
}

class _HomeeState extends State<Homee> {

  @override
  void initState() {
    super.initState();
    getonloaddata();
  }

  getonloaddata() async {
    studentsStream = await DatabaseMethods().getStudentsDetails();
    setState(() {}); //ye something h jo data milne pe frequently refresh krega data sath ki sath
  }

  Stream? studentsStream;
  Widget Showstudents(){
    return StreamBuilder(stream: studentsStream, builder: (context ,AsyncSnapshot snapshots){

      return snapshots.hasData? //check krega ke data h ke nai
      ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          DocumentSnapshot ds = snapshots.data.docs[index];
          return Dismissible(
            key: Key(ds.id), // Har item ke liye unique key zaroori hai
            direction: DismissDirection.endToStart, // Sirf right swipe (end to start)
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) async {
              try {
                await DatabaseMethods().deleteStudentInfo(ds.id);
                Get.snackbar(
                  "Success",
                  "Student deleted successfully!",
                  snackPosition: SnackPosition.TOP,
                  boxShadows: [BoxShadow(color: Color(0xFF76CB65), blurRadius: 15)],
                  colorText: Colors.white,
                  duration: Duration(seconds: 3),
                );
              } catch (e) {
                Get.snackbar(
                  "Error",
                  "Error deleting student: $e",
                  snackPosition: SnackPosition.TOP,
                  boxShadows: [BoxShadow(color: Color(0xC7F65D5D), blurRadius: 15)],
                  colorText: Colors.white,
                  duration: Duration(seconds: 3),
                );
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Name:",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(width: 20),
                          Text(
                            ds["name"],
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              TextEditingController nameController = TextEditingController(text: ds['name']);
                              TextEditingController ageController = TextEditingController(text: ds['age']);
                              TextEditingController courseController = TextEditingController(text: ds['course']);
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Edit Student"),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextField(
                                          controller: nameController,
                                          decoration: InputDecoration(labelText: "Name"),
                                        ),
                                        TextField(
                                          controller: ageController,
                                          decoration: InputDecoration(labelText: "Age"),
                                        ),
                                        TextField(
                                          controller: courseController,
                                          decoration: InputDecoration(labelText: "Course"),
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context); // Dialog close
                                        },
                                        child: Text("Cancel"),
                                      ),
                                      ElevatedButton(
                                        onPressed: () async {
                                          Map<String, dynamic> updatedData = {
                                            "name": nameController.text,
                                            "age": ageController.text,
                                            "course": courseController.text,
                                          };

                                          await DatabaseMethods()
                                              .updateStudentData(ds.id, updatedData)
                                              .then((value) {
                                            Get.snackbar(
                                              "Success",
                                              "Student updated successfully!",
                                              snackPosition: SnackPosition.TOP,
                                              boxShadows: [BoxShadow(color: Color(0xFF76CB65), blurRadius: 15)],
                                              colorText: Colors.white,
                                              duration: Duration(seconds: 3),
                                            );
                                            Navigator.pop(context); // Dialog close
                                          }).catchError((error) {
                                            Get.snackbar(
                                              "Error",
                                              "Failed to update student: $error",
                                              snackPosition: SnackPosition.TOP,
                                              boxShadows: [BoxShadow(color: Color(0xC7F65D5D), blurRadius: 15)],
                                              colorText: Colors.white,
                                              duration: Duration(seconds: 3),
                                            );
                                          });
                                        },
                                        child: Text("Update"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Age:",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 20),
                          Text(
                            ds["age"],
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Course:",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 20),
                          Text(
                            ds["course"],
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: snapshots.data.docs.length,
      )
      :Container();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Title(color: Colors.blue,
                  child:
                  Text("Student's",
                    style: TextStyle(color: Colors.blue,
                        fontWeight: FontWeight.bold),)
              ),
              SizedBox(width: 5,),
              Title(color: Colors.blue,
                  child:
                  Text("Record",
                    style: TextStyle(color: Colors.orange,
                        fontWeight: FontWeight.bold),)
              ),
            ],
          )
      ),
      body:Showstudents(),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.to(AddStudent());
      },child: Icon(Icons.add),),
    );

  }
}