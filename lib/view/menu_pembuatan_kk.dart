import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sikades_pi/view/alasan1_pembuatankk.dart';
import 'package:sikades_pi/view/alasan2_pembuatankk.dart';
import 'package:sikades_pi/view/alasan3_pembuatankk.dart';

class Menu_Pembuatan_KK extends StatefulWidget {
  const Menu_Pembuatan_KK({super.key});

  @override
  State<Menu_Pembuatan_KK> createState() => _Menu_Pembuatan_KKState();
}

class _Menu_Pembuatan_KKState extends State<Menu_Pembuatan_KK> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.only(top: 30, bottom: 10),
        child: Center(
            child: Column(
          children: [
            jpengajuansurat(),
            content(),
          ],
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
        "Pilih Alasan Pembuatan KK",
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget content() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          InkWell(
            onTap: () {
              Get.to(FormAjuanKKPage());
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 146, 240, 148),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Center(child: Text('Baru Menikah')),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              Get.to(Alasan2_Pembuatankk());
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 146, 240, 148),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Center(child: Text('Penambahan Anggota Keluarga')),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              Get.to(Alasan3_Pembuatankk());
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 146, 240, 148),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Center(child: Text('Pengurangan Anggota Keluarga')),
            ),
          )
        ],
      ),
    );
  }
}
