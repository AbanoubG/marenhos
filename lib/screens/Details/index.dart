import 'package:marenhos/models/hymn.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Hymn hymn;

  DetailPage(this.hymn);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hymn.title),
      ), //appbar
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                hymn.ar.replaceAll("\\n", "\n"),
                textScaleFactor: 1.2,
              ),
              SizedBox(height: 12),
              Divider(
                color: Colors.black,
              ),
              SizedBox(height: 12),
              Text(
                hymn.english.replaceAll("\\n", "\n"),
                textScaleFactor: 1.2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
