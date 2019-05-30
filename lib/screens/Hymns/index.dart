<<<<<<< HEAD
import 'package:marenhos/models/hymn.dart';
import 'package:marenhos/screens/Details/index.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
=======
import 'package:arabic_reader/models/app_state.dart';
import 'package:arabic_reader/models/hymn.dart';
import 'package:arabic_reader/screens/Details/index.dart';
import 'package:arabic_reader/utils/pref_utils.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
>>>>>>> f1a885a7393254017dc194d35f106f2c1d5b868b

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
<<<<<<< HEAD
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: new Color(0xFF333333),
=======
  void dispose() {
    super.dispose();
  }

  PreferencesUtils _preferencesUtils;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    _preferencesUtils = Provider.of<PreferencesUtils>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: new Color(0xFF800000),
>>>>>>> f1a885a7393254017dc194d35f106f2c1d5b868b
        title: TextField(
          controller: controller,
          onChanged: (query) {
            setState(() {
              searchQuery = query;
            });
          },
<<<<<<< HEAD
          style: TextStyle(color: Colors.white, fontSize: 20),
=======
          style: TextStyle(
            color: Colors.white,
          ),
>>>>>>> f1a885a7393254017dc194d35f106f2c1d5b868b
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
<<<<<<< HEAD
=======
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () async {
              await Navigator.of(context).pushNamed("/settings");
            },
          ),
          IconButton(
            icon: Icon(Icons.bookmark),
            onPressed: () async {
              await Navigator.of(context).pushNamed("/favorites");
            },
          ),
        ],
>>>>>>> f1a885a7393254017dc194d35f106f2c1d5b868b
      ),
      body: ListView(
        children: widget.hymns
            .where((hymn) =>
                hymn.title.toLowerCase().contains(searchQuery.toLowerCase()))
            .map((hymn) {
          return ListTile(
<<<<<<< HEAD
            title: Text(hymn.title),
            //subtitle: Text(hymn.tag),
=======
            title: Text(
              hymn.title,
              style: theme.textTheme.title,
            ),
            //subtitle: Text(hymn.tag),
            trailing: Consumer<AppState>(
              builder: (_, state, __) {
                final isFav =
                    state.favHymns.where((h) => h.title == hymn.title).length >
                        0;

                return IconButton(
                  icon: Icon(
                    isFav ? Icons.bookmark : Icons.bookmark_border,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    if (isFav)
                      state.remove(hymn);
                    else
                      state.addHymn(hymn);
                    _preferencesUtils.saveAppState(state);
                  },
                );
              },
            ),
>>>>>>> f1a885a7393254017dc194d35f106f2c1d5b868b
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
