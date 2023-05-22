// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, deprecated_member_use, sort_child_properties_last

import 'package:flutter/material.dart';

class FormAjuanSTinggal extends StatefulWidget {
  const FormAjuanSTinggal({super.key});

  @override
  State<FormAjuanSTinggal> createState() => _FormAjuanSTinggalState();
}

class _FormAjuanSTinggalState extends State<FormAjuanSTinggal> {
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
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Color.fromARGB(255, 104, 178, 238), width: 2))),
      padding: EdgeInsets.only(bottom: 10),
      child: Text(
        "Permintaan Surat Keterangan Tinggal",
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget formajuankk() {
    return Container(
      height: 677,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 20, left: 10),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Surat Pengantar RT/RW',
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
                        onPressed: () {},
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
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Fotocopy KTP/Kartu Keluarga dari daerah asal",
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
                        onPressed: () {},
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
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Pas Foto 3x4 sebanyak 3 lembar",
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
                        onPressed: () {},
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
                padding: EdgeInsets.only(top: 10, left: 10),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Formulir permohonan KIPEM/SKTS",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(children: [
                  Expanded(
                    child: TextFormField(
                        readOnly: true,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.transparent,
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                          hintText: 'upload file',
                          contentPadding: EdgeInsets.all(15.0),
                        )),
                  ),
                  const SizedBox(width: 5),
                  ElevatedButton.icon(
                    icon: const Icon(
                      Icons.upload_file,
                      color: Colors.white,
                      size: 24.0,
                    ),
                    label: const Text('Pilih File',
                        style: TextStyle(fontSize: 16.0)),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      minimumSize: const Size(122, 48),
                      maximumSize: const Size(122, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ]),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Fotocopy Kartu Keluarga pengampu pondokan/kost',
                        style: TextStyle(fontSize: 15),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(children: [
                  Expanded(
                    child: TextFormField(
                        readOnly: true,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.transparent,
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                          hintText: 'upload file',
                          contentPadding: EdgeInsets.all(15.0),
                        )),
                  ),
                  const SizedBox(width: 5),
                  ElevatedButton.icon(
                    icon: const Icon(
                      Icons.upload_file,
                      color: Colors.white,
                      size: 24.0,
                    ),
                    label: const Text('Pilih File',
                        style: TextStyle(fontSize: 16.0)),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      minimumSize: const Size(122, 48),
                      maximumSize: const Size(122, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ]),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Fotocopy Kartu Pegawai/Kartu Karyawan/Kartu Pelajar',
                        style: TextStyle(fontSize: 15),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(children: [
                  Expanded(
                    child: TextFormField(
                        readOnly: true,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.transparent,
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                          hintText: 'upload file',
                          contentPadding: EdgeInsets.all(15.0),
                        )),
                  ),
                  const SizedBox(width: 5),
                  ElevatedButton.icon(
                    icon: const Icon(
                      Icons.upload_file,
                      color: Colors.white,
                      size: 24.0,
                    ),
                    label: const Text('Pilih File',
                        style: TextStyle(fontSize: 16.0)),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      minimumSize: const Size(122, 48),
                      maximumSize: const Size(122, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ]),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                margin: EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: (() {}),
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
}
