import 'dart:math';

import 'package:flutter/material.dart';

class PageThree extends StatelessWidget {
  const PageThree({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SunCircle(),
      ),
    );
  }
}

class SunCircle extends StatefulWidget {
  SunCircle({Key key}) : super(key: key);

  @override
  _SunCircleState createState() => _SunCircleState();
}

class _SunCircleState extends State<SunCircle>
    with SingleTickerProviderStateMixin {
  final double _size = 200.0;
  AnimationController _controller;
  static final compareTween = Tween<double>(begin: 0, end: 1);
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 10));

    super.initState();
  }

  void _playAnimation() {
    _controller.reset();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (mounted) {
      _playAnimation();
    }
    return Container(
        child: AnimatedBuilder(
            animation: _controller,
            builder: (_, child) {
              return CustomPaint(
                painter: SunGraphPainter(
                  graphSize: _size,
                  currentPoint: Offset(
                    _controller.value * _size - _size / 2,
                    _getY(_controller.value * _size - _size / 2),
                  ),
                ),
                child: Container(),
              );
            }));
  }

  double _getY(double x) {
    double a = _size / 2;
    double b = _size / 4;
    return -sqrt((b * b * (a * a - x * x)) / (a * a));
  }
}

class SunGraphPainter extends CustomPainter {
  final double graphSize;
  final Offset currentPoint;
  SunGraphPainter({this.graphSize, this.currentPoint});

  static final pathPaint = Paint()
    ..color = Colors.grey
    ..style = PaintingStyle.stroke
    ..strokeWidth = 3;

  static final sunPaint = Paint()
    ..color = Colors.yellow
    ..style = PaintingStyle.fill;

  static final sunxPaint = Paint()
    ..color = Colors.blue
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);

    canvas.drawArc(
        Rect.fromLTWH(-graphSize / 2, -graphSize / 4, graphSize, graphSize / 2),
        0,
        -pi,
        false,
        pathPaint);
    canvas.drawCircle(currentPoint, 10, sunPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
