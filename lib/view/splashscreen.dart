import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sikades_pi/admin/home_admin.dart';
import 'package:sikades_pi/view/login.dart';
import 'package:sikades_pi/view/menu_utama.dart';
import 'package:sikades_pi/view/navbar.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  User? user;
  String? role = "";
  @override
  void initState() {
    // TODO: implement initState
    user = FirebaseAuth.instance.currentUser;
    super.initState();
    openLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 260),
        child: Center(
          child: Column(
            children: [
              Container(
                child: Text(
                  "WELCOME",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Image.asset("assets/images/logo kelurahan kricak.png",
                    height: 160, width: 100),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: FutureBuilder(
                  future: Future.delayed(Duration(seconds: 2)),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      // setelah tampilan splash screen ditampilkan selama 3 detik, pindah ke halaman berikutnya
                      openLogin();
                    }
                    return CircularProgressIndicator(); // menampilkan loading indicator
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  openLogin() {
    Future.delayed(const Duration(seconds: 2)).then((value) async {
      if (user != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .get()
            .then((DocumentSnapshot snap) {
          if (snap.exists) {
            if (snap.get('role') == 'admin') {
              Get.off(() => AdminPage());
            } else if (snap.get('role') == 'user') {
              Get.off(() => NavbarPage());
            }
          }
        });
      } else {
        Get.off(LoginPage());
      }
    });
  }
}
