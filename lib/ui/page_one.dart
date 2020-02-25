import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Stack(
                    children: <Widget>[
                      SizedBox.expand(
                        child: Image.network(
                          "https://66.media.tumblr.com/1929bc958365fa02049285745eeccf4e/tumblr_nj7smiEq2e1tq5z8wo1_640.jpg",
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                      Align(
                        alignment: Alignment(0, -1),
                        child: SafeArea(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(
                                  Icons.menu,
                                  color: Theme.of(context).colorScheme.surface,
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.mic,
                                  color: Theme.of(context).colorScheme.surface,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 70.0, bottom: 30.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            _buildCatelogy(
                                context,
                                Icon(
                                  FontAwesomeIcons.thermometerEmpty,
                                  size: 15,
                                  color: Color(0xfff35588),
                                ), () {
                              print("click");
                            }),
                            _buildCatelogy(
                                context,
                                Icon(
                                  FontAwesomeIcons.calendar,
                                  size: 15,
                                  color: Color(0xff05dfd7),
                                ), () {
                              print("click");
                            }),
                            _buildCatelogy(
                                context,
                                Icon(
                                  FontAwesomeIcons.music,
                                  size: 15,
                                  color: Color(0xffa3f7bf),
                                ), () {
                              print("click");
                            }),
                            _buildCatelogy(
                                context,
                                Icon(
                                  FontAwesomeIcons.tasks,
                                  size: 15,
                                  color: Color(0xfffff591),
                                ), () {
                              print("click");
                            })
                          ],
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Tuesday, Jan 30",
                            style: Theme.of(context).textTheme.headline,
                            textAlign: TextAlign.left,
                          )),
                      Container(
                        padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                        child: Text(
                          "The time is 10:00 AM and you have 71% batery left. Today's high temperature is going to be 44° with a low of 25°",
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.body1,
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            _buildBottomAction(context, "CALL"),
                            _buildBottomAction(context, "TEXT"),
                            _buildBottomAction(context, "EMAIL")
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Theme.of(context)
                            .colorScheme
                            .onBackground
                            .withAlpha(50),
                        offset: Offset(-2, -2),
                        blurRadius: 5,
                        spreadRadius: 0.1)
                  ],
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.all(Radius.circular(35))),
              padding: EdgeInsets.all(5),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.yellow,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "It's now 32°F",
                            style: Theme.of(context).textTheme.body2.copyWith(),
                          ),
                          Text(
                            "In Dacula",
                            style: Theme.of(context).textTheme.body1.copyWith(),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: Icon(
                      Icons.navigation,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBottomAction(BuildContext context, String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      width: 80,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Theme.of(context).colorScheme.background,
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).colorScheme.onBackground.withAlpha(50),
                blurRadius: 5,
                spreadRadius: 0.1)
          ]),
      child: Text(
        title,
        style: Theme.of(context).textTheme.body2,
      ),
    );
  }

  Widget _buildCatelogy(
      BuildContext context, Icon icon, GestureTapCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.background,
            boxShadow: [
              BoxShadow(
                  color:
                      Theme.of(context).colorScheme.onBackground.withAlpha(50),
                  offset: Offset(-2, -2),
                  blurRadius: 5,
                  spreadRadius: 0.1)
            ]),
        padding: EdgeInsets.all(13),
        child: icon,
      ),
    );
  }
}
