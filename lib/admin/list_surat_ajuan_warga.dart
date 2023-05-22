import 'package:flutter/material.dart';

class list_surat_ajuan_warga extends StatelessWidget {
  var listAllDocument;
  list_surat_ajuan_warga({this.listAllDocument, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: listAllDocument.length,
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
        child: Column(
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width,
                height: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    // ignore: prefer_const_constructors
                    BoxShadow(
                      blurRadius: 6,
                      color: Color(0x34000000),
                      offset: Offset(0, 3),
                    )
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${(listAllDocument[index].data() as Map<String, dynamic>)["nama"]}",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                      maxLines: 1,
                    ),
                    Text(
                      "${(listAllDocument[index].data() as Map<String, dynamic>)["umur"]}",
                      style: TextStyle(fontSize: 16.0),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.network(
                                      '${(listAllDocument[index].data() as Map<String, dynamic>)["image"]}')
                                  .image)),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
