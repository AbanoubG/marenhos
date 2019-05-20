import 'package:marenhos/models/hymn.dart';
import 'package:marenhos/screens/Details/index.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HymnScreen extends StatefulWidget {
  final List<Hymn> hymns;

  const HymnScreen({Key key, this.hymns}) : super(key: key);

  @override
  _HymnScreenState createState() => _HymnScreenState();
}

class _HymnScreenState extends State<HymnScreen> {
  String searchQuery = "";

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: new Color(0xFF333333),
        title: TextField(
          controller: controller,
          onChanged: (query) {
            setState(() {
              searchQuery = query;
            });
          },
          style: TextStyle(color: Colors.white, fontSize: 20),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Search",
            hintStyle: TextStyle(color: Colors.grey.shade300, fontSize: 20),
            suffixIcon: searchQuery.isEmpty
                ? Icon(
                    Icons.search,
                    color: Colors.white,
                  )
                : IconButton(
                    icon: Icon(
                      Icons.clear,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      controller.clear();
                      setState(() {
                        searchQuery = "";
                      });
                    },
                  ),
          ),
        ),
      ),
      body: ListView(
        children: widget.hymns
            .where((hymn) =>
                hymn.title.toLowerCase().contains(searchQuery.toLowerCase()))
            .map((hymn) {
          return ListTile(
            title: Text(hymn.title),
            //subtitle: Text(hymn.tag),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailPage(hymn),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
