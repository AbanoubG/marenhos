import 'package:arabic_reader/models/hymn.dart';
import 'package:arabic_reader/screens/Hymns/index.dart';
import 'package:arabic_reader/utils/pref_utils.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: new Color(0xFF800000),
          title: Text('Ⲙⲁⲣⲉⲛϩⲱⲥ', style: TextStyle(fontFamily: 'ArialCoptic'),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () async {
                await Navigator.of(context).pushNamed("/settings");
              },
            ),
          ],
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
                    title: Text(
                      "${category["title"]}",
                      style: theme.textTheme.title,
                    ),
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
                          coptic: data["coptic"],
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
