// ignore_for_file: unused_import, camel_case_types, depend_on_referenced_packages, prefer_const_constructors, unused_element

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sikades_pi/firebase_options.dart';
import 'package:sikades_pi/view/splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashPage(),
    // routes: <String, WidgetBuilder>{
    //   'package:sikades_pi/view/navbar.dart': (BuildContext context) =>
    //       new NavbarPage(),
    // },
  ));
}
