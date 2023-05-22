// ignore_for_file: camel_case_types, avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:sikades_pi/daftar_surat_ajuan_ktp/ajuansuratktp.dart';
import 'package:sikades_pi/view/informasi_desa.dart';
import 'package:sikades_pi/view/menu_pengajuan_surat.dart';
import 'package:sikades_pi/view/profil_users.dart';

class Menu_UtamaPage extends StatefulWidget {
  const Menu_UtamaPage({super.key});

  @override
  State<Menu_UtamaPage> createState() => _Menu_UtamaPageState();
}

class _Menu_UtamaPageState extends State<Menu_UtamaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.only(top: 50, bottom: 10),
        child: Center(
            child: Column(
          children: [judul(), judul2(), logodesa(), daftarmenu()],
        )),
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

  Widget daftarmenu() {
    return Container(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => Menu_PengajuanSuratPage())));
            },
            child: Container(
              width: 250,
              height: 40,
              child: Center(
                child: Text(
                  'Pengajuan Surat',
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Color.fromARGB(255, 146, 240, 148)),
            ),
          ),
          SizedBox(height: 7),
          ElevatedButton(
            onPressed: ((() {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => AjuanSuratKTP())));
            })),
            child: Container(
              width: 250,
              height: 40,
              child: Center(
                child: Text(
                  'Surat Yang Anda Ajukan',
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Color.fromARGB(255, 146, 240, 148)),
            ),
          ),
          SizedBox(height: 7),
          ElevatedButton(
            onPressed: ((() {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => InformasiDesa())));
            })),
            child: Container(
              width: 250,
              height: 40,
              child: Center(
                child: Text(
                  'Informasi Desa',
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Color.fromARGB(255, 146, 240, 148)),
            ),
          ),
          SizedBox(height: 7),
          ElevatedButton(
            onPressed: ((() {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => ProfilPage())));
            })),
            child: Container(
              width: 250,
              height: 40,
              child: Center(
                child: Text(
                  'Akun',
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Color.fromARGB(255, 146, 240, 148)),
            ),
          )
        ],
      ),
    );
  }
}
