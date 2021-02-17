import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sample_text_blink/widget/blink_widget.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Blink',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  Animation<Color> animation;
  AnimationController controller;
  bool isBlink;

  void initAnimation() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this);
    final CurvedAnimation curve =
        CurvedAnimation(parent: controller, curve: Curves.linear);
    animation =
        ColorTween(begin: Colors.transparent, end: Colors.red).animate(curve);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });

    // start animation
    startAnimation();
  }

  void startAnimation() {
    setState(() {
      isBlink = true;
    });
    controller.forward();
  }

  void stopAnimation() {
    setState(() {
      isBlink = false;
    });
    controller.stop();
  }

  @override
  void initState() {
    // TODO: implement initState
    initAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: blinkWidget(animation, "Oat", isBlink),
      ),
    );
  }
}
