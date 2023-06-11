// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_constructors, deprecated_member_use

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sikades_pi/resource/firebase_method.dart';

class FormAjuanKKPage extends StatefulWidget {
  const FormAjuanKKPage({super.key});

  @override
  State<FormAjuanKKPage> createState() => _FormAjuanKKPageState();
}

class _FormAjuanKKPageState extends State<FormAjuanKKPage> {
  XFile? _imgFotoPr;
  XFile? _imgFotoLk;
  XFile? _imgFotoNikah;
  String imgUrlFotoPr = "";
  String imgUrlFotoLk = "";
  String imgUrlFotoNikah = "";
  TextEditingController fotoPrCon = TextEditingController();
  TextEditingController fotoLkCon = TextEditingController();
  TextEditingController fotoNikahCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.only(top: 30, bottom: 10),
        child: Center(
            child: Column(
          children: [jpengajuansurat(), formajuankk()],
        )),
      ),
    );
  }

  Widget jpengajuansurat() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Color.fromARGB(255, 104, 178, 238), width: 2))),
      padding: const EdgeInsets.only(bottom: 10),
      child: const Text(
        "Permintaan Surat Pengantar KK",
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget formajuankk() {
    return Container(
      height: 652,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 20, left: 10),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Isi formulir berikut (Baru menikah)',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Foto KK Asli Pihak Perempuan',
                        style: TextStyle(fontSize: 15),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      controller: fotoPrCon,
                      readOnly: true,
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.transparent,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          hintText: 'upload file',
                          contentPadding: EdgeInsets.all(15)),
                    )),
                    const SizedBox(width: 5),
                    ElevatedButton.icon(
                        icon: const Icon(
                          Icons.upload_file,
                          color: Colors.white,
                          size: 24,
                        ),
                        label: const Text('Pilih File',
                            style: TextStyle(fontSize: 16)),
                        onPressed: () async {
                          final ImagePicker _picker = ImagePicker();
                          XFile? img = await _picker.pickImage(
                              source: ImageSource.gallery);
                          if (img != null) {
                            setState(() {
                              _imgFotoPr = img;
                            });
                            fotoPrCon.text = img.name;
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.grey,
                            minimumSize: const Size(122, 48),
                            maximumSize: const Size(122, 48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )))
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Foto KK Asli Pihak Laki-laki",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      controller: fotoLkCon,
                      readOnly: true,
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.transparent,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          hintText: 'upload file',
                          contentPadding: EdgeInsets.all(15)),
                    )),
                    const SizedBox(width: 5),
                    ElevatedButton.icon(
                        icon: const Icon(
                          Icons.upload_file,
                          color: Colors.white,
                          size: 24,
                        ),
                        label: const Text('Pilih File',
                            style: TextStyle(fontSize: 16)),
                        onPressed: () async {
                          final ImagePicker _picker = ImagePicker();
                          XFile? img = await _picker.pickImage(
                              source: ImageSource.gallery);
                          if (img != null) {
                            setState(() {
                              _imgFotoLk = img;
                            });
                            fotoLkCon.text = img.name;
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.grey,
                            minimumSize: const Size(122, 48),
                            maximumSize: const Size(122, 48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )))
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Foto Buku Nikah",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      controller: fotoNikahCon,
                      readOnly: true,
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.transparent,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          hintText: 'upload file',
                          contentPadding: EdgeInsets.all(15)),
                    )),
                    const SizedBox(width: 5),
                    ElevatedButton.icon(
                        icon: const Icon(
                          Icons.upload_file,
                          color: Colors.white,
                          size: 24,
                        ),
                        label: const Text('Pilih File',
                            style: TextStyle(fontSize: 16)),
                        onPressed: () async {
                          final ImagePicker _picker = ImagePicker();
                          XFile? img = await _picker.pickImage(
                              source: ImageSource.gallery);
                          if (img != null) {
                            setState(() {
                              _imgFotoNikah = img;
                            });
                            fotoNikahCon.text = img.name;
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.grey,
                            minimumSize: const Size(122, 48),
                            maximumSize: const Size(122, 48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )))
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                margin: EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: (() {
                        addKK(_imgFotoPr!, _imgFotoLk!, _imgFotoNikah!);
                        showAddDataSuccessDialog();
                      }),
                      child: Container(
                        width: 60,
                        height: 40,
                        child: Center(
                          child: Text(
                            'Ajukan',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                      ),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)))),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addKK(XFile imgPr, XFile imgLk, XFile imgNikah) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDir = referenceRoot.child('foto_kk_baru_menikah');
    Reference referenceImageUpload = referenceDir.child(fileName);

    String fileName2 = DateTime.now().millisecondsSinceEpoch.toString();
    Reference referenceRoot2 = FirebaseStorage.instance.ref();
    Reference referenceDir2 = referenceRoot2.child('foto_kk_baru_menikah');
    Reference referenceImageUpload2 = referenceDir2.child(fileName2);

    String fileName3 = DateTime.now().millisecondsSinceEpoch.toString();
    Reference referenceRoot3 = FirebaseStorage.instance.ref();
    Reference referenceDir3 = referenceRoot3.child('foto_kk_baru_menikah');
    Reference referenceImageUpload3 = referenceDir3.child(fileName3);

    try {
      await referenceImageUpload.putFile(File(imgPr.path));
      await referenceImageUpload2.putFile(File(imgLk.path));
      await referenceImageUpload3.putFile(File(imgNikah.path));
      imgUrlFotoPr = await referenceImageUpload.getDownloadURL();
      imgUrlFotoLk = await referenceImageUpload2.getDownloadURL();
      imgUrlFotoNikah = await referenceImageUpload3.getDownloadURL();
      await FirebaseMethod()
          .tambahKK(imgUrlFotoPr, imgUrlFotoLk, imgUrlFotoNikah);
    } catch (e) {
      print(e);
    }
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
            'data berhasil ditambahkan',
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
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }
}
