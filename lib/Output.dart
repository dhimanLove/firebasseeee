import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final Map data = Get.arguments;
    final email = data['email'];
    final password = data['password'];

    return Scaffold(
      //backgroundColor: Color(0xff001310),
      backgroundColor: Colors.white
      ,
      appBar: AppBar
        (title: const Text("Second Screen",
          style: TextStyle(color: Color(0xff001310))
      ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.account_circle_sharp,size: 35,)
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Email: $email",
              style: const TextStyle(
                fontSize: 30,
                //fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 10),
            Text(
              "Password: $password",
              style: const TextStyle(
                fontSize: 30,
                //fontWeight: FontWeight.w500,
                color: Colors.black,
              ),

            ),
          ],
        ),
      ),
    );
  }
}
