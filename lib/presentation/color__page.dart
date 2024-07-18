import 'package:flutter/material.dart';

class ColorPage extends StatefulWidget {
  final bool isSwipeLeft;

  ColorPage({required this.isSwipeLeft});

  @override
  _ColorPageState createState() => _ColorPageState();
}

class _ColorPageState extends State<ColorPage> {
  final List<Color> _colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.brown,
  ];

  List<Widget> _generateColorWidgets() {
    List<Offset> fixedPositions = [
      Offset(50, 100),
      Offset(200, 150),
      Offset(100, 250),
      Offset(300, 200),
      Offset(150, 300),
      Offset(250, 350),
      Offset(50, 400),
      Offset(200, 450),
    ];

    List<Widget> widgets = [];

    for (int i = 0; i < _colors.length; i++) {
      widgets.add(Positioned(
        left: fixedPositions[i].dx,
        top: fixedPositions[i].dy,
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: _colors[i],
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ));
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: _generateColorWidgets(),
    );
  }
}
