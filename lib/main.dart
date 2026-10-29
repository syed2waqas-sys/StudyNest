
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:assignment_project/main_screens/login.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  final box = GetStorage();

  Map<String, dynamic> user = {
    "name": "Waqas",
    "age": 25,
    "isDeveloper": true,
  };

  // Convert Map to JSON String
  String jsonString = jsonEncode(user);

  // Write data to GetStorage
  await box.write('user', jsonString);

  // Read data from GetStorage
  String savedData = box.read('user');

  // Convert JSON String back to Map
  Map<String, dynamic> decodedUser = jsonDecode(savedData);

  print('Saved User: $decodedUser');
  print('Name: ${decodedUser['name']}');
  print('Age: ${decodedUser['age']}');
  print('Is Developer: ${decodedUser['isDeveloper']}');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StudyNest',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3F3D9E),
        ),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
