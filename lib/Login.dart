import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login() {
    final username = usernameController.text.trim(); // Trimmed input
    final password = passwordController.text.trim(); // Trimmed input

    if (username.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Error', // Title
        'Username or password cannot be empty', // Message
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red.shade100, // Valid color
        colorText: Colors.black,
        margin: const EdgeInsets.all(10),
      );
      return;
    }

    if (username == 'Loveraj' && password == '11242315') {
      Get.snackbar(
        'Login', // Title
        'Successfully logged in', // Message
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green.shade100,
        colorText: Colors.black,
        margin: const EdgeInsets.all(10),
      );
    } else {
      Get.snackbar(
        'Error', // Title
        'Incorrect username or password', // Message
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red.shade100,
        colorText: Colors.black,
        margin: const EdgeInsets.all(10),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        actions: [
          IconButton(
            onPressed: () async {
              final selectedTime = await showTimePicker(
                context: context,
                initialTime: const TimeOfDay(hour: 10, minute: 00),
                builder: (context, child) => MediaQuery(
                  data: MediaQuery.of(context)
                      .copyWith(alwaysUse24HourFormat: false),
                  child: child!,
                ),
              );
              if (selectedTime != null) {
                debugPrint("Selected Time: ${selectedTime.format(context)}");
              }
            },
            icon: const FaIcon(Icons.access_time_rounded),
          ),
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
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: passwordController,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                onEditingComplete: _login,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _login,
                child: const Text('Login'),
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
