import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sikades_pi/admin/dashboard_admin.dart';
import 'package:sikades_pi/resource/firebase_method.dart';
import 'package:sikades_pi/view/utils/my_color.dart';

class TambahBerita extends StatefulWidget {
  const TambahBerita({super.key});

  @override
  State<TambahBerita> createState() => _TambahBeritaState();
}

class _TambahBeritaState extends State<TambahBerita> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController judulCon = TextEditingController();
  TextEditingController deskCon = TextEditingController();
  TextEditingController _imageController = TextEditingController();

  XFile? _img;
  String imgUrl = "";

  @override
  void initState() {
    // userId = FirebaseAuth.instance.currentUser;

    judulCon.text = "";
    deskCon.text = "";

    super.initState();
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xFF2E4053),
        ),
        elevation: 2,
        title: const Text(
          'Tambah Berita',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: Color(0xFF2E4053),
          ),
        ),
        // backgroundColor: "#34495E".toColor(),
        backgroundColor: Colors.white,
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.all(15.0),
        // color: "#212F3C".toColor(),

        child: content(),
      ),
    );
  }

  Widget content() {
    return Container(
        padding: EdgeInsets.only(top: 20),
        child: PhysicalModel(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: "#EAECEE".toColor(),
          elevation: 3,
          child: Container(
              padding: EdgeInsets.all(15.0),
              width: MediaQuery.of(context).size.width,
              height: 500,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: TextFormField(
                        controller: judulCon,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            label: Text('Judul',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                )),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            return null;
                          } else {
                            return "judul tidak boleh kosong";
                          }
                        },
                      ),
                    ),
                    Container(
                      child: TextFormField(
                        controller: deskCon,
                        maxLines: 4,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            label: Text('Deskripsi',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                )),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "deskripsi tidak boleh kosong";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: SizedBox(
                          height: 55,
                          child: TextFormField(
                            enabled: false,
                            readOnly: true,
                            controller: _imageController,
                            decoration: InputDecoration(
                                hintText: 'foto belum diupload',
                                hintStyle: TextStyle(fontFamily: 'Poppins'),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ))),
                          ),
                        )),
                        Container(
                          height: 55,
                          child: ElevatedButton.icon(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    "#85929E".toColor()),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ))),
                            onPressed: () async {
                              final ImagePicker _picker = ImagePicker();
                              XFile? img = await _picker.pickImage(
                                  source: ImageSource.gallery);
                              if (img != null) {
                                setState(() {
                                  _img = img;
                                });
                                _imageController.text = img.name;
                              }
                            },
                            icon: Icon(Icons.photo_camera),
                            label: Text(
                              'Upload',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold),
                            ),
                            // child: Text('Upload photo',
                            //     style: TextStyle(
                            //         fontFamily: 'Poppins',
                            //         fontSize: 20,
                            //         fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all("#2ECC71".toColor()),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)))),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // addData(judulCon.text, deskCon.text, locCon.text,
                            //     dateInput.text, _img!);

                            // showAddDataSuccessDialog();
                            tambahBerita(_img!);
                          }
                        },
                        child: Text('Tambah',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                    )
                  ],
                ),
              )),
        ));
  }

  Future<void> tambahBerita(XFile image) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDir = referenceRoot.child('berita');
    Reference referenceImageUpload = referenceDir.child(fileName);
    try {
      await referenceImageUpload.putFile(File(image.path));
      imgUrl = await referenceImageUpload.getDownloadURL();
      await FirebaseMethod().tambahBerita(judulCon.text, deskCon.text, imgUrl);
      showAddDataSuccessDialog();
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    super.dispose();
    judulCon.dispose();
    deskCon.dispose();
  }

  void showAddDataSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'data upload',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'berita berhasil ditambahkan',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text(
                'OK',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Get.offAll(DahsboardAdmin());
              },
            ),
          ],
        );
      },
    );
  }
}
