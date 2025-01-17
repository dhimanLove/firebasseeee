import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasseeee/Files/home.dart';
import 'package:firebasseeee/Login.dart';
import 'package:firebasseeee/Output.dart';
import 'package:firebasseeee/Student%20Attendence/homee.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirstScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        Get.snackbar("Cancelled", "Sign-in cancelled");
        return;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await auth.signInWithCredential(credential);
      Get.snackbar("Success", "Google wala part done ");
    } catch (e) {
      Get.snackbar("Error agya", e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("First Screen")),
      body: Container(
        decoration: BoxDecoration(
          //color: Color(0xff001513)
        ),
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              //color: Colors.white30
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: "Email"),
                ),
                SizedBox(height: 14),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password",
                      counterText: "Forgot Password?"
                  ),
                ),
                SizedBox(height: 14),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      await auth.createUserWithEmailAndPassword(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );
                      Get.snackbar(
                        "Success",
                        "User Registered",
                        boxShadows: [BoxShadow(color: Color(0xFFA0F88F), blurRadius: 20)],
                      );
                    } catch (e) {
                      Get.snackbar(
                        "Error",
                        "Fill The Details",
                        boxShadows: [BoxShadow(color: Color(0xC7CC5858), blurRadius: 20)],
                      );

                    }
                  },
                  child: Text("Register"),
                ), //Register Wala
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: signInWithGoogle,
                  child: Text("Sign in with Google"),
                ), //Google Wala
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => Get.to(() => Home()),
                  child: Text("Crud Operations"),
                ),
               /* Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? "),
                    InkWell(
                      onTap: () {
                        Get.to(() =>Login());
                      },
                      child: Text(
                        "Log in",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
