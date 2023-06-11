// ignore_for_file: camel_case_types, avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace, sort_child_properties_last

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sikades_pi/daftar_surat_ajuan_ktp/ajuansuratktp.dart';
import 'package:sikades_pi/view/berita_card.dart';
import 'package:sikades_pi/view/informasi_desa.dart';
import 'package:sikades_pi/view/menu_pengajuan_surat.dart';
import 'package:sikades_pi/view/profil_users.dart';

class Menu_UtamaPage extends StatefulWidget {
  const Menu_UtamaPage({super.key});

  @override
  State<Menu_UtamaPage> createState() => _Menu_UtamaPageState();
}

class _Menu_UtamaPageState extends State<Menu_UtamaPage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference data = firestore.collection("berita");
    return data.orderBy("tanggal", descending: true).snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.only(top: 50, bottom: 10),
          child: Column(
            children: [
              judul(),
              judul2(),
              logodesa(),
              beritaText(),
              beritaView()
            ],
          )),
    );
  }

  Widget beritaView() {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 300,
        child: content(),
      ),
    );
  }

  Widget judul() {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: const Text(
        "SISTEM INFORMASI KEPENDUDUKAN DESA",
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget beritaText() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(bottom: 10, left: 10),
      child: const Text(
        "Berita :",
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget content() {
    return StreamBuilder<QuerySnapshot<Object?>>(
        stream: streamData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            var listAllDocument = snapshot.data!.docs;
            return BeritaCard(listAllDocument: listAllDocument);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Widget judul2() {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: const Text(
        "KELURAHAN KRICAK, TEGALREJO, YOGYAKARTA",
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget logodesa() {
    return Container(
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      child: Image.asset(
        "assets/images/logo kelurahan kricak.png",
        height: 180,
        width: 120,
      ),
    );
  }
}
