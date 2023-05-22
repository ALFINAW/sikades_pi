import 'package:flutter/material.dart';

class list_ajuansuratktp extends StatelessWidget {
  var listAllDocs;
  list_ajuansuratktp({this.listAllDocs, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: listAllDocs.length,
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
        child: Column(
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.fromLTRB(5, 10, 0, 10),
                width: MediaQuery.of(context).size.width,
                height: 136,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6,
                      color: Color(0x34000000),
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 230,
                          child: Text(
                            "${(listAllDocs[index].data() as Map<String, dynamic>)["nama"]}",
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                          ),
                        ),
                        Container(
                          width: 230,
                          child: Text(
                            "${(listAllDocs[index].data() as Map<String, dynamic>)["umur"]}",
                            style: TextStyle(
                              fontSize: 19,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    )
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
