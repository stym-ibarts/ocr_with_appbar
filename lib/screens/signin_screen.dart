import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:ocr/screens/signup_screen.dart';
import 'package:ocr/widgets/button.dart';
import 'package:ocr/widgets/custom_textfield.dart';
import '../widgets/color.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String email = "";
  String password = "";
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    // if (FirebaseAuth.instance.currentUser != null) {
    //   print('signed in');
    // } else {
    //   print('signed out');
    // }

    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/red_background_img.png'),
                  fit: BoxFit.fill)),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isLoading = false;
                    });
                  },
                  child: const Text(
                    "Sign In",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 28, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 32.0),
                CustomTextField(
                  labelText: 'Email',
                  validator: (value) {
                    email = value.toString();
                    final emailRegExp = RegExp(
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                    if (value == null || value.isEmpty) {
                      return 'email is required';
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
                const SizedBox(height: 16.0),
                InkWell(
                  onTap: () {
                    Get.toNamed('/forgotPasswordScreen');
                  },
                  child: const Text(
                    "Forgot Password ?",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 32.0),
                isLoading
                    ? const CircularProgressIndicator(color: AppColors.greyText,)
                    : CustomButton(
                        backgroundColor: AppColors.backgroundPink,
                        textColor: AppColors.backgroundWhite,
                        buttonText: 'Sign In',
                        onPressed: () {
                          if (email.isEmpty || password.isEmpty) {
                            customSnackBar(text: "enter email and password");
                          } else {
                            setState(() {
                              isLoading = true;
                            });
                            login();
                          }
                        }),
                const SizedBox(height: 14.0),
                CustomButton(
                    backgroundColor: AppColors.backgroundWhite,
                    textColor: AppColors.textRed,
                    buttonText: 'Cancel',
                    onPressed: () {
                      Get.toNamed('/scanner');
                    }),
                const SizedBox(height: 16.0),
                InkWell(
                  onTap: () {
                    Get.to(() => const SignupScreen(),
                        transition: Transition.fade);
                  },
                  child: const Text(
                    "Don't have an account ? Sign Up",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Future<void> login() async {
    final auth = FirebaseAuth.instance;
    await auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then(
      (value) {
        setState(() {
          isLoading = false;
        });
        Get.toNamed('/dashboard');
      },
    ).onError((error, stackTrace) {
      customSnackBar(text: "Login failed: Invalid Username or Password");
      return null;
    });
  }
}
