import 'package:firebasseeee/Service/Database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_string/random_string.dart';

class Employee extends StatefulWidget {
  const Employee({super.key});

  @override
  State<Employee> createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
  TextEditingController nameController = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController positionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
          title:
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Title(color: Colors.blue,
                  child:
                  Text("Employee",
                    style: TextStyle(color: Colors.blue,
                        fontWeight: FontWeight.bold),)
              ),
              SizedBox(width: 5,),
              Title(color: Colors.blue,
                  child:
                  Text("CRUD",
                    style: TextStyle(color: Colors.orange,
                        fontWeight: FontWeight.bold),)
              ),
            ],
          )

      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),

              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelText: "Enter Name",
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
                  labelText: "Enter Age",
                  suffixIcon: Icon(Icons.calendar_month),

                ),

              ),
              SizedBox(height: 20,),

              Text("Position",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
              SizedBox(height: 20,),
              TextField(
                controller: positionController,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelText: "Enter Position",
                  suffixIcon: Icon(Icons.work),
                ),
              ),
              SizedBox(height: 12,),
              Center(child: ElevatedButton(
                  onPressed: () async{
                    String Id = randomAlphaNumeric(10);
                    Map<String, dynamic> employeeInfoMap = {
                      "name": nameController.text,
                      "age": agecontroller.text,
                      "Id":Id,
                      "position": positionController.text,
                    };
                    await DatabaseMethods().addEmployeeDetails(employeeInfoMap ,Id).then((value){
                     Get.snackbar("Success", "Employee Added");
                    });
                  },
                  child: Text("Add")
              )
              )
            ],
          ),
        ),
      ),
    );
  }
}
