import 'package:avatar_glow/avatar_glow.dart';
import 'package:diagram/pages/diagram.dart';
import 'package:diagram/utils/delayed_animation.dart';
import 'package:flutter/material.dart';

class firstPage extends StatefulWidget {
  @override
  _firstPageState createState() => _firstPageState();
}

class _firstPageState extends State<firstPage>
    with SingleTickerProviderStateMixin {
  final int delayedAmount = 500;
  late double _scale;
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final color = Colors.white;
    _scale = 1 - _controller.value;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 57, 57, 58),
        body: Center(
          child: Column(
            children: <Widget>[
              AvatarGlow(
                endRadius: 90,
                duration: Duration(seconds: 2),
                glowColor: Colors.white24,
                repeat: true,
                repeatPauseDuration: Duration(seconds: 2),
                startDelay: Duration(seconds: 1),
                child: Material(
                  elevation: 9.0,
                  shape: CircleBorder(),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[100],
                    child: FlutterLogo(
                      size: 70.0,
                    ),
                    radius: 70.0,
                  ),
                ),
              ),
              DelayedAnimation(
                child: Text(
                  "Olá",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35.0,
                      color: color),
                ),
                delay: delayedAmount + 1000,
                direction: 'up',
              ),
              SizedBox(
                height: 40.0,
              ),
              DelayedAnimation(
                child: Text(
                  "Quer um Diagrama?",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35.0,
                      color: color),
                ),
                delay: delayedAmount + 2000,
                direction: 'up',
              ),
              SizedBox(
                height: 50.0,
              ),
              DelayedAnimation(
                child: Text(
                  "Bora criar..!",
                  style: TextStyle(fontSize: 20.0, color: color),
                ),
                delay: delayedAmount + 3000,
                direction: 'up',
              ),
              SizedBox(
                height: 80.0,
              ),
              // DelayedAnimation(
              //   child: Text(
              //     "Bora criar..!",
              //     style: TextStyle(fontSize: 20.0, color: color),
              //   ),
              //   delay: delayedAmount + 3000,
              //   direction: 'up',
              // ),
              // SizedBox(
              //   height: 100.0,
              // ),
              DelayedAnimation(
                child: GestureDetector(
                  child: Transform.scale(
                    scale: _scale,
                    child: _animatedButtonUI,
                  ),
                ),
                delay: delayedAmount + 5000,
                direction: 'up',
              ),
              SizedBox(
                height: 80.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _animatedButtonUI => Container(
        child: Center(
          child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.lightGreenAccent,
                elevation: 25,
                shadowColor: Color.fromARGB(255, 173, 20, 173)),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DiagramPage(),
              ),
            ),
            child: Text(
              'Clique Aqui!',
              style: TextStyle(
                  // backgroundColor: Colors.greenAccent,
                  color: const Color.fromARGB(255, 41, 40, 40),
                  fontSize: 20),
            ),
          ),
        ),
      );
}
