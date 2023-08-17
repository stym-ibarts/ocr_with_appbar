import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../widgets/button.dart';
import '../widgets/color.dart';

class Database extends StatefulWidget {
  const Database({super.key});

  @override
  State<Database> createState() => _DatabaseState();
}

class _DatabaseState extends State<Database> {
  FirebaseDatabase database = FirebaseDatabase.instance;
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerInvoice = TextEditingController();

  @override
  void dispose() {
    // Dispose of the text controllers when they are no longer needed.
    _controllerName.dispose();
    _controllerInvoice.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/red_background_img.png'),
                  fit: BoxFit.fill)),
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  const Text(
                    'Firebase real-time database',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 50),
                  TextFormField(
                    controller: _controllerName,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "NAME",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      errorStyle: TextStyle(
                        // Customize error text style
                        color: Colors.white, // Change the color
                        fontSize: 14.0, // Change the size
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    controller: _controllerInvoice,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Invoive Number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      errorStyle: TextStyle(
                        // Customize error text style
                        color: Colors.white, // Change the color
                        fontSize: 14.0, // Change the size
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  CustomButton(
                    backgroundColor: AppColors.backgroundPink,
                    textColor: AppColors.backgroundWhite,
                    buttonText: 'Add to database',
                    onPressed: () async {
                      final myUuid = const Uuid().v4();
                      final displayName =
                          FirebaseAuth.instance.currentUser!.displayName;
                      final user = "$displayName/$myUuid";
            
                      String name = _controllerName.value.text;
                      String invoiceNumber = _controllerInvoice.value.text;
            
                      DatabaseReference ref = FirebaseDatabase.instance.ref(user);
            
                      ref.set({
                        "name": name,
                        "invoice_number": invoiceNumber,
                        "creation_time": ServerValue.timestamp
                      });
                    },
                  ),
                  const SizedBox(height: 25),
                  CustomButton(
                    backgroundColor: AppColors.backgroundWhite,
                    textColor: AppColors.textRed,
                    buttonText: 'Cancel',
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
