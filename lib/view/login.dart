// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, sized_box_for_whitespace, sort_child_properties_last

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sikades_pi/admin/home_admin.dart';
import 'package:sikades_pi/services/signUp.dart';
import 'package:sikades_pi/view/menu_utama.dart';
import 'package:sikades_pi/view/navbar.dart';
import './signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController emailCon = TextEditingController();
  TextEditingController passCon = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // openHome();
  }

  @override
  void dispose() {
    emailCon.dispose();
    passCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.only(top: 50, bottom: 10),
        child: Center(
            child: Column(
          children: [
            content()
            // judul(),
            // judul2(),
            // logodesa(),
            // login_email(),
            // login_password(),
            // btn_login(),
            // inginbuatakun()
          ],
        )),
      ),
    );
  }

  Widget content() {
    return Container(
      height: 653,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    "SISTEM INFORMASI KEPENDUDUKAN DESA",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "KELURAHAN KRICAK, TEGALREJO, YOGYAKARTA",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 30),
                  child: Image.asset(
                    "assets/images/logo kelurahan kricak.png",
                    height: 180,
                    width: 120,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
                  child: TextFormField(
                    controller: emailCon,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person_outline),
                        label: Text('Email'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email harus diisi";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
                  child: TextFormField(
                    controller: passCon,
                    obscureText: true,
                    decoration: InputDecoration(
                        label: Text('Password'),
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password harus diisi";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 83,
                  margin: EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ))),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        userLogin();
                      }
                    },
                    child: Text('Sign In', style: TextStyle(fontSize: 17)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Belum mempunyai akun?'),
                      SizedBox(width: 7),
                      InkWell(
                        onTap: () {
                          Get.to(SignupPage());
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  // Widget judul() {
  //   return Container(
  //     padding: const EdgeInsets.only(top: 20),
  //     child: const Text(
  //       "SISTEM INFORMASI KEPENDUDUKAN DESA",
  //       style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
  //       textAlign: TextAlign.center,
  //     ),
  //   );
  // }

  // Widget judul2() {
  //   return Container(
  //     padding: const EdgeInsets.only(top: 10),
  //     child: const Text(
  //       "KELURAHAN KRICAK, TEGALREJO, YOGYAKARTA",
  //       style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
  //       textAlign: TextAlign.center,
  //     ),
  //   );
  // }

  // Widget logodesa() {
  //   return Container(
  //     padding: const EdgeInsets.only(top: 30),
  //     child: Image.asset(
  //       "assets/images/logo kelurahan kricak.png",
  //       height: 180,
  //       width: 120,
  //     ),
  //   );
  // }

  // Widget login_email() {
  //   return Container(
  //     padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
  //     child: Column(children: [
  //       SizedBox(
  //         child: TextFormField(
  //           controller: emailCon,
  //           decoration: InputDecoration(
  //               labelText: 'Email',
  //               border: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(30))),

  //         ),
  //       )
  //     ]),
  //   );
  // }

  // Widget login_password() {
  //   return Container(
  //     padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
  //     child: Column(children: [
  //       SizedBox(
  //         child: TextFormField(
  //           obscureText: true,
  //           controller: passCon,
  //           decoration: InputDecoration(
  //               labelText: 'Password',
  //               border: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(30))),

  //         ),
  //       )
  //     ]),
  //   );
  // }

  // Widget btn_login() {
  //   return Container(
  //     padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
  //     child: Column(
  //       children: [
  //         ElevatedButton(
  //           onPressed: () {
  //                     if (_formKey.currentState!.validate()) {
  //                       userLogin();
  //                     }
  //                   },
  //           // onPressed: userLogin,
  //           child: Container(
  //             width: double.infinity,
  //             height: 58,
  //             child: Center(
  //               child: Text(
  //                 'Sign In',
  //                 textAlign: TextAlign.center,
  //                 style: TextStyle(fontSize: 17),
  //               ),
  //             ),
  //           ),
  //           style: ButtonStyle(
  //               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
  //                   RoundedRectangleBorder(
  //                       borderRadius: BorderRadius.circular(30)))),
  //         )
  //       ],
  //     ),
  //   );
  // }

  // Widget inginbuatakun() {
  //   return Container(
  //     padding: EdgeInsets.only(top: 30),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Text(
  //           'Belum mempunyai akun?',
  //         ),
  //         SizedBox(width: 7),
  //         InkWell(
  //           onTap: () {
  //             Navigator.push(context,
  //                 MaterialPageRoute(builder: ((context) => SignupPage())));
  //           },
  //           child: Text(
  //             'Sign Up',
  //             style: TextStyle(color: Colors.blue),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  // Future<void> userLogin() async {
  //   await FirebaseAuth.instance
  //       .signInWithEmailAndPassword(
  //           email: emailCon.text.trim(), password: passCon.text.trim())
  //       .then((value) {
  //     FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(FirebaseAuth.instance.currentUser!.uid)
  //         .get()
  //         .then((DocumentSnapshot snap) {
  //       if (snap.exists) {
  //         if (snap.get('role') == 'admin') {
  //           Get.off(AdminPage());
  //         } else if (snap.get('role') == 'user') {
  //           Get.off(Menu_UtamaPage());
  //         }
  //       }
  //     });
  //   });
  // }
  void userLogin() async {
    var loginEmail = emailCon.text.trim();
    var loginPass = passCon.text.trim();

    try {
      final User? firebaseUser =
          (await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: loginEmail,
        password: loginPass,
      ))
              .user;
      if (firebaseUser != null) {
        route();
      }
    } on FirebaseException catch (e) {
      print(e.message);

      loginFailed();
    }
  }

  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('role') == "admin") {
          Get.off(AdminPage());
        } else {
          Get.off(NavbarPage());
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  void loginFailed() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Gagal login',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'username atau password salah',
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
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }
}
