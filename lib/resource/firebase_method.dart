import 'package:cloud_firestore/cloud_firestore.dart';
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
}
