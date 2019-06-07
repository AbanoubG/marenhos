import 'package:arabic_reader/models/app_state.dart';
import 'package:arabic_reader/models/hymn.dart';
import 'package:arabic_reader/screens/Details/index.dart';
import 'package:arabic_reader/utils/pref_utils.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

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
        title: TextField(
          controller: controller,
          onChanged: (query) {
            setState(() {
              searchQuery = query;
            });
          },
          style: TextStyle(
            color: Colors.white,
          ),
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
      ),
      body: ListView(
        children: widget.hymns
            .where((hymn) =>
                hymn.title.toLowerCase().contains(searchQuery.toLowerCase()))
            .map((hymn) {
          return ListTile(
            title: Text(
              hymn.title,
              style: theme.textTheme.title,
            ),
            subtitle: Text(
              hymn.tag,
              style: TextStyle(fontFamily: 'ArialCoptic')
              ),
            trailing: Consumer<AppState>(
              builder: (_, state, __) {
                final isFav =
                    state.favHymns.where((h) => h.title == hymn.title).length >
                        0;

                return IconButton(
                  icon: Icon(
                    isFav ? Icons.bookmark : Icons.bookmark_border,
                    color: Colors.redAccent,
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
