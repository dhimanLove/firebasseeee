import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  void _login() {
    final username = usernameController.text;
    final password = passwordController.text;

    if (username == 'Loveraj' && password == '11242315') {
      Get.snackbar(
        'Login',
        'Successfully logged in',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.white,
        colorText: Colors.black,
        margin: EdgeInsets.all(10),
      );
    } else {
      Get.snackbar(
        'Error',
        'Incorrect username or password',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.white,
        colorText: Colors.black,
        margin: EdgeInsets.all(10),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login'),
        actions: [
          IconButton( onPressed: () async {
            final selectedTime = await showTimePicker(
              context: context,
              initialTime: const TimeOfDay(hour: 10, minute: 00),
              builder: (context, child) => MediaQuery(
                data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
                child: child!,
              ),
            );
            if (selectedTime != null) {
              print("Selected Time: ${selectedTime.format(context)}");
            }
          }, icon: FaIcon(Icons.access_time_rounded))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: passwordController,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                onEditingComplete: _login,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 24),
              
              ElevatedButton(
                onPressed: _login,
                child: Text('login'),
              ),
              
              SizedBox(height: 5,)
            ]),
        ),
      ),
    );
  }
}
