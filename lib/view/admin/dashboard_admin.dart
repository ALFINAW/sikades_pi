import 'package:flutter/material.dart';
import 'package:sikades_pi/view/utils/my_color.dart';

class DashboardAdmin extends StatefulWidget {
  const DashboardAdmin({super.key});

  @override
  State<DashboardAdmin> createState() => _DashboardAdminState();
}

class _DashboardAdminState extends State<DashboardAdmin> {
  int _selected_index = 0;

  void _updated_index(int index) {
    setState(() {
      _selected_index = index;
    });

    final pages = [
      const FeedAdmin(),
      Text('1112222222'),
      Text('1133333333'),
    ];
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPressed,
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: SafeArea(
          minimum: EdgeInsets.only(bottom: 8),
          child: Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: "#2E4053".toColor().withOpacity(0.8),
                borderRadius: BorderRadius.circular(25)),
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
                      color: _selected_index == 0
                          ? Colors.white
                          : "#99A3A4".toColor(),
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
                      Icons.feedback,
                      color: _selected_index == 1
                          ? Colors.white
                          : "#99A3A4".toColor(),
                      size: 25,
                    ),
                  ),
                ),
                Spacer(),
                Spacer(),
                Spacer(),
                Spacer(),
                SizedBox(
                  height: 40,
                  width: 40,
                  child: IconButton(
                    onPressed: () {
                      _updated_index(2);
                    },
                    icon: Icon(
                      Icons.help_center,
                      color: _selected_index == 2
                          ? Colors.white
                          : "#99A3A4".toColor(),
                      size: 25,
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
                      color: _selected_index == 3
                          ? Colors.white
                          : "#99A3A4".toColor(),
                      size: 30,
                    ),
                  ),
                ),
                Spacer()
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: "#99A3A4".toColor(),
            child: Icon(
              Icons.add,
              size: 35,
            ),
            onPressed: () {
              Get.to(TambahAduan());
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: dashboardItems.elementAt(_selected_index),
      ),
    );
  }
}
