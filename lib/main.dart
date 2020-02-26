import 'dart:math';

import 'package:animationdemo/global/theme/app_themes.dart';
import 'package:animationdemo/global/theme/theme_changer.dart';
import 'package:animationdemo/ui/page_five.dart';
import 'package:animationdemo/ui/page_four.dart';
import 'package:animationdemo/ui/page_one.dart';
import 'package:animationdemo/ui/page_three.dart';
import 'package:animationdemo/ui/page_two.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
        create: (_) => ThemeChanger(appThemeData['Green Light']),
        child: MaterialAppWithTheme());
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme.getThemeData().copyWith(
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: <TargetPlatform, PageTransitionsBuilder>{
                TargetPlatform.android: ZoomPageTransitionsBuilder(),
              },
            ),
          ),
      home: MyHomePage(title: "Demo"),
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
  bool isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              final randomIndex = Random().nextInt(3);
              appTheme.setThemeData(AppTheme.values[randomIndex]);
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          _buildItem("Demo Theme Color", () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => PageOne()));
          }),
          _buildItem("Demo Curve Animation", () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => PageTwo()));
          }),
          _buildItem("Demo Sun Circle", () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => PageThree()));
          }),
          _buildItem("Demo UI 1", () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => PageFour()));
          }),
          _buildItem("Demo Social UI", () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => PageFive()));
          }),
        ],
      ),
    );
  }

  Widget _buildItem(String title, GestureTapCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: ListTile(
          leading: Container(
            width: 40,
            height: 40,
            padding: EdgeInsets.all(5),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
            child: Image.asset(
              'assets/images/placeholder.png',
            ),
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
    );
  }
}
