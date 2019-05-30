<<<<<<< HEAD
import 'package:marenhos/models/hymn.dart';
=======
import 'package:arabic_reader/models/hymn.dart';
>>>>>>> f1a885a7393254017dc194d35f106f2c1d5b868b
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Hymn hymn;

  DetailPage(this.hymn);

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Scaffold(
      appBar: AppBar(
        title: Text(hymn.title),
        backgroundColor: new Color(0xFF333333),
=======
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: new Color(0xFF800000),
        title: Text(
          hymn.title,
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
      ), //appbar
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
<<<<<<< HEAD
              Text(
                hymn.ar.replaceAll("\\n", "\n"),
                textScaleFactor: 1.2,
=======
              // Text(
              //   hymn.ar?.replaceAll("\\n", "\n") ?? "",
              //   style: theme.textTheme.title,
              // ),
              // SizedBox(height: 12),
              // Divider(
              //   color: Colors.black,
              // ),
              SizedBox(height: 12),
              Text(
                hymn.english?.replaceAll("\\n", "\n") ?? "",
                style: theme.textTheme.title,
>>>>>>> f1a885a7393254017dc194d35f106f2c1d5b868b
              ),
              SizedBox(height: 12),
              Divider(
                color: Colors.black,
              ),
              SizedBox(height: 12),
              Text(
<<<<<<< HEAD
                hymn.english.replaceAll("\\n", "\n"),
                textScaleFactor: 1.2,
=======
                hymn.coptic?.replaceAll("\\n", "\n") ?? "",
                style: theme.textTheme.title.copyWith(
                    fontFamily: "ArialCoptic", fontWeight: FontWeight.w200),
>>>>>>> f1a885a7393254017dc194d35f106f2c1d5b868b
              ),
            ],
          ),
        ),
      ),
    );
  }
}
