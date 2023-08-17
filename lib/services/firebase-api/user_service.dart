// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:ocr/widgets/color.dart';
// import '../variables.dart';

// class UserService {
//   static UserService instance = UserService();
//   String authenticate() {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     return auth.currentUser == null ? "" : auth.currentUser!.uid;
//   }

//   void updateToken(String uid) async {
//     final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
//     await _firebaseMessaging.getToken().then((token) {
//       loginCollection.doc(uid).update({"messageToken": token});
//     });
//   }

//   Future<bool> resetPassword(String email) async {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     try {
//       await auth.sendPasswordResetEmail(email: email);
//       return true;
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         customSnackBar(text: "Account not found");
//       } else if (e.code == 'invalid-email') {
//         customSnackBar(text: "Email address is invalid");
//       }
//       return false;
//     }
//   }

//   void signOut({bool isTV = false}) async {
//     await FirebaseAuth.instance.signOut();
//     customSnackBar(text: "Signed out");
//     Get.offAllNamed("/login");
//   }
// }
