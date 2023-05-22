import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sikades_pi/model/berita.dart';

class FirebaseMethod {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //add berita
  Future<String> addAduan(String beritaId, String judul, String deskripsi,
      String imageUrl, String tanggal, String userid) async {
    String res = "Some error occurred";
    try {
      final col = _firestore.collection('berita');
      final doc = col.doc();
      Berita aduan = Berita(
          beritaId: doc.id,
          judul: judul,
          deskripsi: deskripsi,
          imageUrl: imageUrl,
          tanggal: tanggal);
      _firestore.collection('berita').doc(doc.id).set(aduan.toJson());
      res = "Success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
