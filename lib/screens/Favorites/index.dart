import 'package:arabic_reader/models/app_state.dart';
import 'package:arabic_reader/screens/Details/index.dart';
import 'package:arabic_reader/utils/pref_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final _preferencesUtils = Provider.of<PreferencesUtils>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: new Color(0xFF800000),
        title: Text(
          'Bookmarked',
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
      body: Consumer<AppState>(builder: (_, state, __) {
        return ListView(
          children: state.favHymns.map((hymn) {
            return ListTile(
              title: Text(
                hymn.title,
                style: theme.textTheme.title,
              ),
              trailing: Consumer<AppState>(
                builder: (_, state, __) {
                  final isFav = state.favHymns
                          .where((h) => h.title == hymn.title)
                          .length >
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
        );
      }),
    );
  }
}
