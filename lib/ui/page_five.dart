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
double maxPrice = 150;
double maxDistance = 10;

class _PageFiveState extends State<PageFive> {
  RangeValues priceRange = RangeValues(0.2, 0.6);
  double distanceValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[_buildProfileCard(), _buildFilterCard()],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterCard() {
    return Container(
      width: 300,
      child: Card(
        elevation: elevationDefault,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radiusDefault))),
        child: Container(
          padding: EdgeInsets.all(paddingDefault),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Filters",
                    style: Theme.of(context).textTheme.title,
                  ),
                  Icon(FontAwesomeIcons.timesCircle),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Price",
                    style: Theme.of(context).textTheme.body2,
                  ),
                  Text(
                    "\$${(priceRange.start * maxPrice).round()}-\$${(priceRange.end * maxPrice).round()}",
                    style: Theme.of(context).textTheme.body1.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onBackground
                            .withAlpha(90)),
                  ),
                ],
              ),
              RangeSlider(
                values: priceRange,
                onChanged: (rangeChange) {
                  setState(() {
                    this.priceRange = rangeChange;
                  });
                },
                onChangeEnd: (RangeValues endValues) {
                  print('Ended change at $endValues');
                },
                onChangeStart: (RangeValues startValues) {
                  print('Start change at $startValues');
                },
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Distance",
                    style: Theme.of(context).textTheme.body2,
                  ),
                  Text(
                    "${(distanceValue*maxDistance).toStringAsFixed(1)}km",
                    style: Theme.of(context).textTheme.body1.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onBackground
                            .withAlpha(90)),
                  ),
                ],
              ),
              Slider(
                value: distanceValue,
                onChanged: (value) {
                  setState(() {
                    distanceValue = value;
                  });
                },
                onChangeStart: (startValue) {
                  print('Start change at $startValue');
                },
                onChangeEnd: (endValue) {
                  print('Ended change at $endValue');
                },
              )
            ],
          ),
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Theme.of(context).colorScheme.background,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.more_horiz,
                              color: Theme.of(context).colorScheme.background,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
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
