import 'package:arabic_reader/models/hymn.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Hymn hymn;

  DetailPage(this.hymn);

  @override
  Widget build(BuildContext context) {
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
      ), //appbar
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
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
              ),
              SizedBox(height: 12),
              Divider(
                color: Colors.black,
              ),
              SizedBox(height: 12),
              Text(
                hymn.coptic?.replaceAll("\\n", "\n") ?? "",
                style: theme.textTheme.title.copyWith(
                    fontFamily: "ArialCoptic", fontWeight: FontWeight.w200),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
