import 'package:flutter/material.dart';

class Alasan3_Pembuatankk extends StatefulWidget {
  const Alasan3_Pembuatankk({super.key});

  @override
  State<Alasan3_Pembuatankk> createState() => _Alasan3_PembuatankkState();
}

class _Alasan3_PembuatankkState extends State<Alasan3_Pembuatankk> {
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
                padding: EdgeInsets.only(top: 20, left: 10),
                // ignore: prefer_const_literals_to_create_immutables
                child: Column(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Isi formulir berikut (Pengurangan anggota keluarga)',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Foto KK Lama', style: TextStyle(fontSize: 15)),
                  )
                ]),
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
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Foto Surat Pendukung (Surat kematian, surat ket pindah, surat cerai)',
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
