
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasseeee/Files/Employee.dart';
import 'package:firebasseeee/Service/Database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

  Stream?employeeStream;

  Widget allEmployeeDetails(){
    return StreamBuilder(
        builder:(context,AsyncSnapshot snapshot){
      return snapshot.hasData
          ?ListView.builder(
        itemCount: snapshot.data.docs.length,
          itemBuilder: (context ,index){
          DocumentSnapshot ds = snapshot.data.docs[index];
           return Container(
             child: Column(
               children: [
                 Padding(
                   padding: const EdgeInsets.all(10),
                   child: Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       border: Border.all(color: Colors.orange,width: 1),
                     ),
                     width: MediaQuery.of(context).size.width,
                     //color: Colors.red,
                     child: Padding(
                       padding: const EdgeInsets.all(15),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text("Name: "+ds["name"],style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.w600),),
                           Text("Age: "+ds["age"],style: TextStyle(color: Colors.orange,fontSize: 20,fontWeight: FontWeight.w600)),
                           Text("Position :"+ds["position"],style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.w600),),

                         ],
                       ),
                     ),
                   ),
                 )
               ],
             ),
           );
          })
          :Center(child: CircularProgressIndicator(),);
    }, stream: employeeStream,);
  }

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
       Get.to(Employee());
      },child: Icon(Icons.add),),
      appBar: AppBar(
        title:
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Title(color: Colors.blue,
              child:
              Text("Flutter",
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
      body:
      Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.orange,width: 1),
                ),
                width: MediaQuery.of(context).size.width,
                //color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name: Loveraj",style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.w600),),
                      Text("Age: 20",style: TextStyle(color: Colors.orange,fontSize: 20,fontWeight: FontWeight.w600)),
                      Text("Position :Volunteer",style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.w600),),

                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
