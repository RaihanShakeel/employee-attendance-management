// import 'package:flutter/material.dart';
// import 'package:flutter/meterial.dart';


// class MyTextField extends StatefulWidget {
//   const MyTextField({super.key});

//   @override
//   State<MyTextField> createState() => _MyTextFieldState();
// }

// class _MyTextFieldState extends State<MyTextField> {
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//               onChanged: (value) {
//                 _email = value.trim();
//               },
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return 'This field is required';
//                 } else {
//                   return null;
//                 }
//               },
//               keyboardType: TextInputType.emailAddress,
//               decoration: InputDecoration(
//                 prefixIcon: Icon(Icons.email),
//                 label: Text('Email Address'),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//             );
//   }
// }