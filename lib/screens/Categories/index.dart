<<<<<<< HEAD
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
          backgroundColor: new Color(0xFF333333),
          title: Text('Ⲙⲁⲣⲉⲛϩⲱⲥ', style: TextStyle(fontFamily: 'Coptic'),),
=======
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
>>>>>>> f1a885a7393254017dc194d35f106f2c1d5b868b
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
<<<<<<< HEAD
                    title: Text("${category["title"]}"),
=======
                    title: Text(
                      "${category["title"]}",
                      style: theme.textTheme.title,
                    ),
>>>>>>> f1a885a7393254017dc194d35f106f2c1d5b868b
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
<<<<<<< HEAD
                          coptic:data["cop"]
=======
                          coptic: data["coptic"],
>>>>>>> f1a885a7393254017dc194d35f106f2c1d5b868b
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
