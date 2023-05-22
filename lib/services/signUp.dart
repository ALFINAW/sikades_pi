// ignore_for_file: unused_import, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:sikades_pi/view/login.dart';

//variabel untuk register
signUpUser(
  String uEmail,
  String uNama,
  String uNik,
  String uPass,
  String role,
) async {
  User? userid = FirebaseAuth.instance.currentUser;
  try {
    await FirebaseFirestore.instance.collection("users").doc(userid!.uid).set({
      "email": uEmail,
      "nama": uNama,
      "NIK": uNik,
      "userid": userid.uid,
      "created at": DateTime.now(),
      "role": role
    }).then((value) => {FirebaseAuth.instance.signOut(), Get.to(LoginPage())});
  } on FirebaseAuthException catch (e) {}
}

// void loginUser(
//   String uEmail,
//   String uPass,
// ) async {
  
//   }

