import 'dart:math';

import 'package:dynamicthemeexample/theme_notifier.dart';
import 'package:dynamicthemeexample/theme_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:provider/provider.dart';
import 'theme_button.dart';

void main() {
  runApp(ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(blueTheme), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Dynamic Theme",
      theme: themeNotifier.getTheme(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Randomise the custom theme on the first load
  ThemeData _customTheme = ThemeData(
      primaryColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
      accentColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
      backgroundColor: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            Text(
              "Current Theme Colors",
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(height: 8),
            _themeColorContainer(
                "Primary Color", Theme.of(context).primaryColor),
            _themeColorContainer("Accent Color", Theme.of(context).accentColor),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Select Pre-defined Themes",
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ThemeButton(buttonThemeData: blueTheme),
                ThemeButton(buttonThemeData: spookyTheme),
                ThemeButton(buttonThemeData: greenTheme),
                ThemeButton(buttonThemeData: pinkTheme),
              ],
            ),
            Spacer(),
            Text(
              "Select Custom Theme",
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(height: 24),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      flex: 5,
                      child: ThemeButton(buttonThemeData: _customTheme)),
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 5,
                          child: Container(
                            width: double.infinity,
                            child: FlatButton(
                                onPressed: () => _openDialog("Primary Color",
                                    _customTheme.primaryColor, true),
                                color: _customTheme.primaryColor,
                                child: Text("Choose Primary Color",
                                    textAlign: TextAlign.center,
                                    style:
                                        _customTheme.primaryTextTheme.button)),
                          ),
                        ),
                        Spacer(),
                        Expanded(
                          flex: 5,
                          child: Container(
                            width: double.infinity,
                            child: FlatButton(
                                onPressed: () => _openDialog("Accent Color",
                                    _customTheme.accentColor, false),
                                color: _customTheme.accentColor,
                                child: Text("Choose Accent Color",
                                    textAlign: TextAlign.center,
                                    style:
                                        _customTheme.primaryTextTheme.button)),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  // Returns simple container to display what color the theme is currently using.
  Widget _themeColorContainer(String colorName, Color color) {
    return Container(
      width: double.infinity,
      height: 50,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 16),
      color: color,
      child: Text(colorName,
          textAlign: TextAlign.center,
          style: Theme.of(context).primaryTextTheme.button),
    );
  }

  // Dialog to select colors for theme.
  void _openDialog(String title, Color currentColor, bool primaryColor) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(6.0),
          title: Text(title),
          content: Container(
            height: 250,
            child: MaterialColorPicker(
              selectedColor: currentColor,
              onColorChange: (color) => setState(() => _customTheme =
                  (primaryColor)
                      ? _customTheme.copyWith(primaryColor: color)
                      : _customTheme.copyWith(accentColor: color)),
              onMainColorChange: (color) => setState(() => _customTheme =
                  (primaryColor)
                      ? _customTheme.copyWith(primaryColor: color)
                      : _customTheme.copyWith(accentColor: color)),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Done",
                style: Theme.of(context).textTheme.button,
              ),
            )
          ],
        );
      },
    );
  }
}
