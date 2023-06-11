// ignore_for_file: camel_case_types, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sikades_pi/view/form_ajuan_ktp.dart';
import 'package:sikades_pi/view/alasan1_pembuatankk.dart';
import 'package:sikades_pi/view/form_ajuan_skck.dart';
import 'package:sikades_pi/view/form_ajuan_skelahiran.dart';
import 'package:sikades_pi/view/form_ajuan_skematian.dart';
import 'package:sikades_pi/view/form_ajuan_snikah.dart';
import 'package:sikades_pi/view/form_ajuan_spindah.dart';
import 'package:sikades_pi/view/form_ajuan_stinggal.dart';
import 'package:sikades_pi/view/menu_pembuatan_kk.dart';

class Menu_PengajuanSuratPage extends StatefulWidget {
  const Menu_PengajuanSuratPage({super.key});

  @override
  State<Menu_PengajuanSuratPage> createState() =>
      _Menu_PengajuanSuratPageState();
}

class _Menu_PengajuanSuratPageState extends State<Menu_PengajuanSuratPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.only(top: 30, bottom: 10),
        child: Center(
            child: Column(
          children: [jpengajuansurat(), listpengajuansurat()],
        )),
      ),
    );
  }

  Widget jpengajuansurat() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Color.fromARGB(255, 146, 240, 148), width: 2))),
      padding: EdgeInsets.only(bottom: 10),
      child: Text(
        "Pengajuan Surat",
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget listpengajuansurat() {
    return Container(
      height: 652,
      width: double.infinity,
      child: GridView.count(
        crossAxisCount: 2,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 40, right: 5),
            child: Expanded(
                child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => FormAjuanPage())));
              },
              child: Column(children: <Widget>[
                Image(
                  image: AssetImage('assets/images/logo ktp.png'),
                  height: 100,
                  width: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Permintaan Surat Pengantar KTP',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )
              ]),
            )),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 40, left: 5),
            child: Expanded(
                child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => Menu_Pembuatan_KK())));
              },
              child: Column(children: <Widget>[
                Image(
                  image: AssetImage('assets/images/logo kk.png'),
                  height: 100,
                  width: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Permintaan Surat Pengantar KK',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )
              ]),
            )),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 40, right: 5),
            child: Expanded(
                child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => FormAjuanSmati())));
              }),
              child: Column(children: <Widget>[
                Image(
                  image: AssetImage('assets/images/logo kematian.png'),
                  height: 100,
                  width: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Permintaan Surat Kematian',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )
              ]),
            )),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 40, left: 5),
            child: Expanded(
                child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => FormAjuanSLahir())));
              }),
              child: Column(children: <Widget>[
                Image(
                  image: AssetImage('assets/images/logo kelahiran.png'),
                  height: 100,
                  width: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Permintaan Surat Kelahiran',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )
              ]),
            )),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 30, right: 5),
            child: Expanded(
                child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => FormAjuanSTinggal())));
              }),
              child: Column(children: <Widget>[
                Image(
                  image: AssetImage('assets/images/logo tempat tinggal.png'),
                  height: 100,
                  width: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Permintaan Surat Keterangan Tinggal',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )
              ]),
            )),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 40, left: 5),
            child: Expanded(
                child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => FormAjuanSNikah())));
              }),
              child: Column(children: <Widget>[
                Image(
                  image: AssetImage('assets/images/logo pernikahan.png'),
                  height: 100,
                  width: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Permintaan Surat Nikah',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )
              ]),
            )),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 30, right: 5),
            child: Expanded(
                child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: (() {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => FormAjuanSKCK())));
              }),
              child: Column(children: <Widget>[
                Image(
                  image: AssetImage('assets/images/logo skck.png'),
                  height: 100,
                  width: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Permintaan Surat Keterangan Catatan Kepolisian',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )
              ]),
            )),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 30, left: 5),
            child: Expanded(
                child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => FormAjuanSPindah())));
              }),
              child: Column(children: <Widget>[
                Image(
                  image: AssetImage(
                      'assets/images/logo pindah tempat tinggal.png'),
                  height: 100,
                  width: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Permintaan Surat Keterangan Pindah',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )
              ]),
            )),
          )
        ],
      ),
    );
  }
}
