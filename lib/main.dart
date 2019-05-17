import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Arabic Reader'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

Future<List<Hymn>> _getHymns() async {

  var data = await http.get("http://www.json-generator.com/api/json/get/bUQVTKDXYi?indent=2");

  var jsonData = jsonDecode(data.body);

  List<Hymn> hymns = [];

  for (var u in jsonData){

    Hymn hymn = Hymn (u["tag"], u["title"], u["text"]);
    hymns.add(hymn);
  }

  print(hymns.length);

  return hymns;

}



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getHymns(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text("Loading..."),
                ), //center
              ); //container
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(snapshot.data[index].title),
                    subtitle: Text(snapshot.data[index].tag),
                    onTap: (){

                      Navigator.push(context,
                          new MaterialPageRoute(builder: (context) => DetailPage(snapshot.data[index]))
                      );
                    },

                  ); //ListTile
                },
              ); //ListView.Builder
            }
          },
       ),//FutureBuilder
     ), //Container
    );//Scaffold

  }

  
}

class DetailPage extends StatelessWidget{

  final Hymn hymn;

  DetailPage(this.hymn);

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hymn.title),
      ),//appbar
      body: new Container(
        padding: new EdgeInsets.all(10.0),
        child: new Text(
            hymn.text,
          textAlign: TextAlign.left,
          textScaleFactor: 1.2,
      ),

      ),
    );
  }
}

class Hymn {
  final String tag;
  final String title;
  final String text;

  Hymn(this.tag,this.title,this.text);


}


