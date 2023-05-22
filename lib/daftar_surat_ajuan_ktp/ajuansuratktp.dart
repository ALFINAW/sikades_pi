import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sikades_pi/daftar_surat_ajuan_ktp/list_ajuansuratktp.dart';

class AjuanSuratKTP extends StatefulWidget {
  const AjuanSuratKTP({super.key});

  @override
  State<AjuanSuratKTP> createState() => _AjuanSuratKTPState();
}

class _AjuanSuratKTPState extends State<AjuanSuratKTP> {
  User? userid = FirebaseAuth.instance.currentUser;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference data = firestore.collection("data_ktp");
    return data.where("userid", isEqualTo: userid!.uid).snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.only(top: 50, bottom: 10),
        child: Center(
            child: Column(
          children: [judulbar(), content()],
        )),
      ),
    );
  }

  Widget judulbar() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Color.fromARGB(255, 146, 240, 148), width: 2))),
      padding: EdgeInsets.only(bottom: 10),
      child: Text(
        "Daftar Surat yang Diajukan",
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget content() {
    return StreamBuilder<QuerySnapshot<Object?>>(
      stream: streamData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          var listAllDocument = snapshot.data!.docs;

          return list_ajuansuratktp(
            listAllDocs: listAllDocument,
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      }
    );
  }
}
