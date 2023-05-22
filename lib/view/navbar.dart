// import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sikades_pi/daftar_surat_ajuan_ktp/ajuansuratktp.dart';
import 'package:sikades_pi/view/informasi_desa.dart';
import 'package:sikades_pi/view/menu_pengajuan_surat.dart';
import 'package:sikades_pi/view/menu_utama.dart';
import 'package:sikades_pi/view/profil_users.dart';

class NavbarPage extends StatefulWidget {
  const NavbarPage({super.key});

  @override
  State<NavbarPage> createState() => _NavbarPageState();
}

class _NavbarPageState extends State<NavbarPage> {
  int _selected_index = 0;

  void _updated_index(int index) {
    setState(() {
      _selected_index = index;
    });
  }

  final pages = [
    Menu_UtamaPage(),
    AjuanSuratKTP(),
    InformasiDesa(),
    ProfilPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(color: Color.fromARGB(255, 146, 240, 148)),
          child: Row(
            children: [
              Spacer(),
              SizedBox(
                height: 40,
                width: 40,
                child: IconButton(
                  padding: EdgeInsets.only(right: 20),
                  onPressed: () {
                    _updated_index(0);
                  },
                  icon: Icon(
                    Icons.home,
                    color: _selected_index == 0 ? Colors.black : Colors.green,
                    size: 30,
                  ),
                ),
              ),
              Spacer(),
              SizedBox(
                height: 40,
                width: 40,
                child: IconButton(
                  onPressed: () {
                    _updated_index(1);
                  },
                  icon: Icon(
                    Icons.archive,
                    color: _selected_index == 1 ? Colors.black : Colors.green,
                    size: 30,
                  ),
                ),
              ),
              Spacer(),
              Spacer(),
              SizedBox(
                height: 40,
                width: 40,
                child: IconButton(
                  padding: EdgeInsets.only(left: 10),
                  onPressed: () {
                    _updated_index(2);
                  },
                  icon: Icon(
                    Icons.info,
                    color: _selected_index == 2 ? Colors.black : Colors.green,
                    size: 30,
                  ),
                ),
              ),
              Spacer(),
              SizedBox(
                height: 40,
                width: 40,
                child: IconButton(
                  padding: EdgeInsets.only(left: 10),
                  onPressed: () {
                    _updated_index(3);
                  },
                  icon: Icon(
                    Icons.person,
                    color: _selected_index == 3 ? Colors.black : Colors.green,
                    size: 30,
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          child: Icon(
            Icons.add,
            size: 35,
          ),
          onPressed: () {
            Get.to(Menu_PengajuanSuratPage());
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: pages.elementAt(_selected_index),
    );
  }
}
