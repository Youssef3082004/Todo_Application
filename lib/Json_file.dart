// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: JsonExample(),
//     );
//   }
// }

// class JsonExample extends StatefulWidget {
//   const JsonExample({super.key});

//   @override
//   State<JsonExample> createState() => _JsonExampleState();
// }

// class _JsonExampleState extends State<JsonExample> {
//   String _data = "No data yet";

//   Future<void> _writeJson() async {
//     final dir = await getApplicationDocumentsDirectory();
//     final file = File("${dir.path}/user.json");

//     Map<String, dynamic> user = {
//       "username": "Ali",
//       "email": "ali@example.com",
//       "age": 22,
//     };

//     await file.writeAsString(jsonEncode(user));

//     setState(() {
//       _data = "JSON written to: ${file.path}";
//     });
//   }

//   // قراءة JSON من الملف
//   Future<void> _readJson() async {
//     final dir = await getApplicationDocumentsDirectory();
//     final file = File("${dir.path}/user.json");

//     if (await file.exists()) {
//       String contents = await file.readAsString();
//       final data = jsonDecode(contents);
//       setState(() {
//         _data = "Username: ${data["username"]}\nEmail: ${data["email"]}\nAge: ${data["age"]}";
//       });
//     } else {
//       setState(() {
//         _data = "File not found!";
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("JSON File Example")),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             ElevatedButton(
//               onPressed: _writeJson,
//               child: const Text("Write JSON"),
//             ),
//             const SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: _readJson,
//               child: const Text("Read JSON"),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               _data,
//               style: const TextStyle(fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
