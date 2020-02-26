import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PageFive extends StatefulWidget {
  PageFive({Key key}) : super(key: key);

  @override
  _PageFiveState createState() => _PageFiveState();
}

double radiusDefault = 10;
double radiusButton = 20;
double elevationDefault = 10;
double marginDefault = 10;
double paddingDefault = 10;

class _PageFiveState extends State<PageFive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[_buildProfileCard()],
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      width: 300,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radiusDefault))),
        elevation: elevationDefault,
        child: Wrap(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/five/profile_cover.png",
                      fit: BoxFit.fitWidth,
                    ),
                    Container(
                        child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 50,
                        ),
                        Text("Tyler, The Creator",
                            style: Theme.of(context).textTheme.title),
                        Text("1.2M followers",
                            style: Theme.of(context).textTheme.body1),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(radiusButton)),
                                  color: Theme.of(context).colorScheme.primary),
                              child: Text("Follow",
                                  style: Theme.of(context)
                                      .textTheme
                                      .button
                                      .copyWith(color: Colors.white)),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(radiusButton)),
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground
                                      .withAlpha(40)),
                              child: Icon(
                                FontAwesomeIcons.comment,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    )),
                  ],
                ),
                Align(
                  alignment: Alignment(0, -1),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 70,
                      ),
                      Container(
                          width: 80,
                          height: 80,
                          child: Image.asset(
                              "assets/images/five/profile_avatar.png")),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
