import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sikades_pi/admin/home_admin.dart';
import 'package:sikades_pi/admin/tambah_berita.dart';
import 'package:sikades_pi/view/utils/my_color.dart';

class DahsboardAdmin extends StatefulWidget {
  const DahsboardAdmin({super.key});

  @override
  State<DahsboardAdmin> createState() => _DahsboardAdminState();
}

class _DahsboardAdminState extends State<DahsboardAdmin> {
  int _selected_index = 0;

  void _updated_index(int index) {
    setState(() {
      _selected_index = index;
    });
  }

  Future<bool> onBackPressed() {
    if (_selected_index != 0) {
      setState(() {
        _selected_index = 0;
      });
      return Future.value(false); // Tidak tindak lanjuti navigasi kembali
    }
    return Future.value(true); // Tindak lanjuti navigasi kembali
  }

  final pages = [
    AdminPage(),
    const Text('11122222111'),
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPressed,
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: SafeArea(
          child: Container(
            padding: EdgeInsets.all(12),
            decoration:
                BoxDecoration(color: Color.fromARGB(255, 146, 240, 148)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
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
                      color: _selected_index == 0
                          ? Colors.white
                          : "#99A3A4".toColor(),
                      size: 30,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: 40,
                  child: IconButton(
                    onPressed: () {
                      _updated_index(1);
                    },
                    icon: Icon(
                      Icons.person,
                      color: _selected_index == 1
                          ? Colors.white
                          : "#99A3A4".toColor(),
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: IndexedStack(
          index: _selected_index,
          children: pages,
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.green,
            child: Icon(
              Icons.add,
              size: 35,
            ),
            onPressed: () {
              Get.to(TambahBerita());
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
