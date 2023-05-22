// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, sized_box_for_whitespace, sort_child_properties_last

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sikades_pi/services/signUp.dart';
import 'package:sikades_pi/view/login.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController emailCon = TextEditingController();
  TextEditingController namaCon = TextEditingController();
  TextEditingController nikCon = TextEditingController();
  TextEditingController passCon = TextEditingController();

  String role = "user";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.only(top: 50, bottom: 10),
        child: Center(
            child: Column(
          children: [content()],
        )),
      ),
    );
  }

  Widget content() {
    return Container(
      height: 656,
      child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "Register",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
                child: TextFormField(
                  controller: emailCon,
                  decoration: InputDecoration(
                      label: Text('Email'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Harap masukan email";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
                child: TextFormField(
                  controller: namaCon,
                  decoration: InputDecoration(
                      label: Text('Nama Lengkap'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Harap masukan nama";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
                child: TextFormField(
                  controller: nikCon,
                  keyboardType: TextInputType.number,
                  maxLength: 16,
                  decoration: InputDecoration(
                      label: Text('NIK'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[0-9]{16}$').hasMatch(value)) {
                      return "Harap masukan NIK dengan benar";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
                child: TextFormField(
                    controller: passCon,
                    obscureText: true,
                    decoration: InputDecoration(
                        label: Text('Password'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                    validator: _requeiredConfirmValidator),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      label: Text('Konfirmasi Password'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                  validator: _requeiredConfirmValidator,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.only(top: 20, left: 30, right: 30),
                width: double.infinity,
                height: 75,
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ))),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      addData();
                    }
                  },
                  child: Text('Sign Up',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 17)),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Sudah mempunyai akun? '),
                    SizedBox(width: 7),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.blue),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }

  void addData() async {
    User? user = FirebaseAuth.instance.currentUser;
    final auth = FirebaseAuth.instance;

    var uEmail = emailCon.text.trim();
    var uNama = namaCon.text;
    var uNik = nikCon.text.trim();
    var uPass = passCon.text.trim();

    final List<String> loginMethod =
        await auth.fetchSignInMethodsForEmail(uEmail);
    if (loginMethod.isEmpty) {
      await auth
          .createUserWithEmailAndPassword(
            email: uEmail,
            password: uPass,
          )
          .then((value) => {
                signUpUser(uEmail, uNama, uNik, uPass, role),
                showSignUpSuccessDialog()
              });
    } else {}
  }

  void showSignUpSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'register',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'pendaftaran behasil',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text(
                'OK',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Get.to(LoginPage());
              },
            ),
          ],
        );
      },
    );
  }

  String? _requeiredConfirmValidator(String? confirmPasswordText) {
    if (confirmPasswordText == null || confirmPasswordText.trim().isEmpty) {
      return 'Harap masukan password';
    }
    if (passCon.text != confirmPasswordText) {
      return 'Password tidak sama';
    } else {
      return null;
    }
  }
}
