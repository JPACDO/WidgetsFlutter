import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  const AnimatedContainerPage({super.key});

  @override
  State<AnimatedContainerPage> createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 210.0;
  double _hight = 10.0;
  Color _color = Colors.pink;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animaetd Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
          width: _width,
          height: _hight,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: _color,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _cambiarForma,
        child: Icon(Icons.play_arrow),
      ),
    );
  }

  void _cambiarForma() {
    final random = Random();
    setState(() {
      _width = random.nextInt(300).toDouble(); //random();
      _hight = random.nextInt(300).toDouble(); // random();
      _color = Color.fromRGBO(random.nextInt(255), random.nextInt(255),
          random.nextInt(255), random.nextDouble());
      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
      // print('$_width y $_hight');
    });
  }

  // double random() {
  //   final random = Random();
  //   double a = random.nextInt(300).toDouble();
  //   print(a);
  //   return a;
  // }
}
