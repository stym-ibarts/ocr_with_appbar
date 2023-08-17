import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ocr/screens/scanner.dart';
import 'package:ocr/screens/signin_screen.dart';
import 'package:ocr/widgets/custom_textfield.dart';
import '../widgets/button.dart';
import '../widgets/color.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String email = "";
  String password = "";
  String username = "";
// / bool _showError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/red_background_img.png'),
            fit: BoxFit.fill,
          ),
        ),
        padding: const EdgeInsets.only(left: 22, right: 22),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text("Sign Up",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28, color: Colors.white)),
              const SizedBox(height: 32.0),
              CustomTextField(
                labelText: 'Name',
                validator: (value) {
                  username = value.toString();
                  if (value == null || value.isEmpty) return 'Name is required';
                  return null;
                },
              ),
              const SizedBox(height: 23.0),
              CustomTextField(
                labelText: 'Email',
                validator: (value) {
                  email = value.toString();
                  final emailRegExp = RegExp(
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  } else if (!emailRegExp.hasMatch(value)) {
                    return "Invalid email address";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 23.0),
              CustomTextField(
                labelText: 'Password',
                validator: (value) {
                  password = value.toString();
                  if (value == null || value.isEmpty) {
                    return 'password is required';
                  }
                  return null;
                },
                isPassword: true,
              ),
              const SizedBox(height: 23.0),
              InkWell(
                onTap: () {
                  Get.to(() => const SignInScreen(),
                      transition: Transition.fade);
                },
                child: const Text(
                  "Have an account ? Sign In",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              const SizedBox(height: 32.0),
              CustomButton(
                  backgroundColor: AppColors.backgroundPink,
                  textColor: AppColors.backgroundWhite,
                  buttonText: 'Sign Up',
                  onPressed: () {
                    if (email.isEmpty || password.isEmpty) {
                      customSnackBar(text: "please enter email and password");
                    } else {
                      signup();
                    }
                  }),
              const SizedBox(height: 14.0),
              CustomButton(
                  backgroundColor: AppColors.backgroundWhite,
                  textColor: AppColors.textRed,
                  buttonText: 'Cancel',
                  onPressed: () {
                    Get.to(() => const Scanner(), transition: Transition.fade);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signup() async {
    final auth = FirebaseAuth.instance;
    await auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => value.user?.updateDisplayName(username))
        .then((value) => {
              Get.toNamed('/signInScreen'),
              customSnackBar(text: "Account Created Successfully.....")
            })
        .onError((error, stackTrace) {
      customSnackBar(text: error.toString().substring(37));
      // ignore: cast_from_null_always_fails
      return null as FutureOr<Set<void>>;
    });
  }
}
