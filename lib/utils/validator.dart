// import 'package:flutter/foundation.dart';
// import 'package:flutter/widgets.dart';

// class Validator extends StatefulWidget {
//   const Validator({super.key});

//   @override
//   State<Validator> createState() => _ValidatorState();
// }

// class _ValidatorState extends State<Validator> {
//   final _nameController = TextEditingController();
//   final _passwordController = TextEditingController();
//   String _nameError = "";
//   String _passwordError = "";

//   void _validateName(String name) {
//     setState(() {
//       _nameError = "";
//       if (name.trim().isEmpty) {
//         _nameError = "empty";
//       } else if (name.trim().length < 4) {
//         _nameError = "char less than 4";
//       }
//     });
//   }

//   void _validatePassword(String email) {
//     setState(() {
//       _passwordError = "";
//       if (email.trim().isEmpty) {
//         _passwordError = "empty";
//       } else if (email.trim().length < 4) {
//         _passwordError = "char less than 5";
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
