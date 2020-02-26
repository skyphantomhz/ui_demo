import 'package:flutter/material.dart';

class PageFour extends StatefulWidget {
  PageFour({Key key}) : super(key: key);

  @override
  _PageFourState createState() => _PageFourState();
}

class _PageFourState extends State<PageFour> {
  List<Character> _characters;
  PageController _controller;

  @override
  void initState() {
    _characters = List<Character>()
      ..add(Character("Uzumaki Naruto", "assets/images/image_1.png"))
      ..add(Character("Uchiha Sasuke", "assets/images/image_2.png"))
      ..add(Character("Sakura Haruno", "assets/images/image_1.png"))
      ..add(Character("Shikamaru Nara", "assets/images/image_2.png"))
      ..add(Character("Kakashi Hatake", "assets/images/image_1.png"));

      _controller = PageController(viewportFraction: 0.7);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height:400,
          child: PageView.builder(
            itemCount: _characters.length,
            itemBuilder: (context, index) {
              final item = _characters[index];
              return _buildCard(item);
            },
            controller: _controller,
          ),
        ),
      ),
    );
  }

  Widget _buildCard(Character character) {
    return Card(
        elevation: 8,
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  gradient: LinearGradient(colors: [
                    Colors.black.withAlpha(100),
                    Colors.black.withAlpha(100)
                  ])),
              child: Image.asset(character.url),
            ),
            Align(
              alignment: Alignment(0, -1),
              child: Text(
                character.name,
                style: Theme.of(context)
                    .textTheme
                    .title
                    .copyWith(color: Colors.white),
              ),
            )
          ],
        ),
    
    );
  }
}

class Character {
  Character(this.name, this.url);
  String name;
  String url;
}
