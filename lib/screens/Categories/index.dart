import 'package:marenhos/models/hymn.dart';
import 'package:marenhos/screens/Hymns/index.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ⲙⲁⲣⲉⲛϩⲱⲥ', style: TextStyle(fontFamily: 'Coptic'),),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection("categories").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting ||
                  !snapshot.hasData)
                return Center(child: CircularProgressIndicator());

              final categoriesList = snapshot.data.documents;
              return ListView.builder(
                itemCount: categoriesList.length,
                itemBuilder: (BuildContext context, int index) {
                  final category = categoriesList[index].data;
                  if (category == null)
                    return Center(child: CircularProgressIndicator());
                  return ListTile(
                    title: Text("${category["title"]}"),
                    //subtitle: Text("${category["tag"]}"),
                    onTap: () async {
                      final hymnDocs = await categoriesList[index]
                          .reference
                          .collection("hymns")
                          .getDocuments();
                      final hymns = hymnDocs.documents.map((snap) {
                        final data = snap.data;
                        return Hymn(
                          title: data["title"],
                          english: data["english"],
                          ar: data["ar-e"],
                        );
                      }).toList();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => HymnScreen(hymns: hymns),
                        ),
                      );
                    },
                  ); //ListTile
                },
              );
            }) //Container
        ); //Scaffold
  }
}
