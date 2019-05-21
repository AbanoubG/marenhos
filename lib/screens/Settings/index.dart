import 'package:arabic_reader/models/app_state.dart';
import 'package:arabic_reader/models/hymn.dart';
import 'package:arabic_reader/utils/pref_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void dispose() {
    _preferencesUtils.saveAppState(appState);
    super.dispose();
  }

  AppState appState;
  PreferencesUtils _preferencesUtils;
  @override
  Widget build(BuildContext context) {
    appState = Provider.of<AppState>(context);
    _preferencesUtils = Provider.of<PreferencesUtils>(context);
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: new Color(0xFF800000),
        title: Text(
          "Settings",
          style: theme.textTheme.title.copyWith(color: Colors.white),
        ),
      ), //appbar
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Text(
                "Fonts Size",
                style: theme.textTheme.title,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: <Widget>[
                Expanded(
                  child: Slider(
                    value: appState.fontSize.toDouble(),
                    max: 32,
                    min: 14,
                    divisions: 32 - 14,
                    onChanged: (value) {
                      appState.fontSize = value.toInt();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    appState.fontSize.round().toString(),
                    style: theme.textTheme.headline,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Divider(
                color: Colors.black,
              ),
            ),
            SwitchListTile(
              value: appState.isDark,
              title: Text(
                "Dark Theme",
                style: theme.textTheme.title,
              ),
              onChanged: (value) {
                appState.isDark = value;
              },
            )
          ],
        ),
      ),
    );
  }
}
