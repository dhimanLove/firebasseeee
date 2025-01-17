//import 'package:firebasseeee/Files/home.dart';
//import 'package:firebasseeee/Implement.dart';
import 'package:firebasseeee/Student%20Attendence/homee.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Firebase',
      theme: ThemeData(
        //appBarTheme: Color(),
        //scaffoldBackgroundColor: Color(0xA8EFEFEF),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        tooltipTheme: const TooltipThemeData(
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
     // home: FirstScreen(),
      home: Homee(),
    );
  }
}
