//This Fille have the code for my Student's Record Database Project

import 'package:firebasseeee/Service/Databasee.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_string/random_string.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  TextEditingController namecontroller= TextEditingController();
  TextEditingController agecontroller= TextEditingController();
  TextEditingController coursecontroller= TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        actions: [
          IconButton(onPressed: (){},
              icon: Icon(Icons.account_circle_sharp)),
        ],
        //automaticallyImplyLeading: false,
          title:
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Title(color: Colors.blue,
                  child:
                  Text("Student",
                    style: TextStyle(color: Colors.blue,
                        fontWeight: FontWeight.bold),)
              ),
              SizedBox(width: 5,),
              Title(color: Colors.blue,
                  child:
                  Text("Add",
                    style: TextStyle(color: Colors.orange,
                        fontWeight: FontWeight.bold),)
              ),
            ],
          )

      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child:
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),

              TextField(
               controller: namecontroller ,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue)
                  ),
                 // labelText: "Enter Name",
                  suffixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 20,),

              Text("Age",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              TextField(
               controller: agecontroller,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                 // labelText: "Enter Age",
                  suffixIcon: Icon(Icons.calendar_month),

                ),

              ),
              SizedBox(height: 20,),

              Text("Course",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
              SizedBox(height: 20,),
              TextField(
               controller: coursecontroller,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                 // labelText: "Enter Position",
                  suffixIcon: Icon(Icons.work),
                ),
              ),
              SizedBox(height: 12,),
              Center(
                child:
                ElevatedButton(
                  onPressed: () async {
                    if (namecontroller.text.isEmpty ||
                        agecontroller.text.isEmpty ||
                        coursecontroller.text.isEmpty) {
                      Get.snackbar(
                        "Error",
                        "Fill The Details",
                        snackPosition: SnackPosition.TOP,
                        duration: Duration(seconds: 2),
                        boxShadows: [BoxShadow(color: Color(0xC7F65D5D), blurRadius: 15)],
                        colorText: Colors.white,
                      );
                      return;
                    }

                    String id = randomAlphaNumeric(10);
                    Map<String, dynamic> StudentInfo = {
                      "name": namecontroller.text,
                      "age": agecontroller.text,
                      "course": coursecontroller.text,
                    };

                    await DatabaseMethods().addStudents(StudentInfo, id).then((value) {
                      namecontroller.text = "";
                      agecontroller.text = "";
                      coursecontroller.text = "";
                      Get.snackbar(
                        "Success",
                        "Student's Data is Uploaded!!",
                        snackPosition: SnackPosition.TOP,
                        boxShadows: [BoxShadow(color: Color(0xFF76CB65), blurRadius: 15)],
                        duration: Duration(seconds: 3),
                       //backgroundColor: Colors.green,
                        colorText: Colors.white,
                      );

                    })
                        .catchError((love) {

                      Get.snackbar(
                        "Error",
                        "Something went wrong!",
                        snackPosition: SnackPosition.TOP,
                        //duration: Duration(seconds: 2),
                        //boxShadows: [BoxShadow(color: Color(0xC7CC5858), blurRadius: 20)],
                        //colorText: Colors.white,
                      );
                    });
                  },
                  child: Text("Add"),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
