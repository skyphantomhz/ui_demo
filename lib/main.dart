import 'package:animationdemo/ui/page_one.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

enum BannerViewMode { DarkMode, LightMode }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.from(colorScheme: const ColorScheme.light()).copyWith(
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
    return Theme(
      data: Theme.of(context).copyWith(
          colorScheme: isDarkMode ? ColorScheme.dark() : ColorScheme.light()
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            PopupMenuButton<BannerViewMode>(
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<BannerViewMode>>[
                PopupMenuItem<BannerViewMode>(
                  value: BannerViewMode.DarkMode,
                  child: ListTile(
                    title: Text("Dark mode"),
                    trailing: Switch(
                      onChanged: (isDarkMode){
                        setState(() {
                          this.isDarkMode = isDarkMode;
                        });
                      },
                      value: isDarkMode,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
        body: ListView(
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => PageOne()));
              },
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
                    "Demo 1",
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
