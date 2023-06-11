import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:sikades_pi/model/berita.dart';

class FirebaseMethod {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //add berita
  Future<String> tambahBerita(
      String judul, String deskripsi, String imageUrl) async {
    String res = "Some error occurred";
    DateTime dateTime = DateTime.now();

    String formattedDate = DateFormat('dd MMMM yyyy').format(dateTime);
    try {
      final col = _firestore.collection('berita');
      final doc = col.doc();
      Berita aduan = Berita(
          beritaId: doc.id,
          judul: judul,
          deskripsi: deskripsi,
          imageUrl: imageUrl,
          tanggal: formattedDate);
      _firestore.collection('berita').doc(doc.id).set(aduan.toJson());
      res = "Success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<void> tambahKK(
      String fotoPR, String fotoLK, String fotoBukuNikah) async {
    try {
      final col = _firestore.collection('data_kk');
      final doc = col.doc();
      await _firestore.collection('data_kk').doc(doc.id).set({
        "alasan": 'Baru menikah',
        'foto_pihak_perempuan': fotoPR,
        'foto_pihak_laki': fotoLK,
        'foto_buku_nikah': fotoBukuNikah
      });
    } catch (e) {
      print(e);
    }
  }
}
