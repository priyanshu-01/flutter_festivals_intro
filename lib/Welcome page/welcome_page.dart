import 'package:flutter/material.dart';

class WelocomePage extends StatefulWidget {
  const WelocomePage({Key? key}) : super(key: key);

  @override
  State<WelocomePage> createState() => _WelocomePageState();
}

class _WelocomePageState extends State<WelocomePage> {
  Color _color = Colors.orange;
  double _radius = 0;
  double _dimension = 200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AnimatedContainer(
            duration: Duration(seconds: 1),
            height: _dimension,
            width: _dimension,
            decoration: BoxDecoration(
              color: _color,
              // shape: _boxShape,
              borderRadius: BorderRadius.circular(_radius),
            ),
          ),
          TextButton(
            child: Text(
              "change color",
              style: TextStyle(color: Colors.grey[800]),
            ),
            onPressed: () {
              print("color changes to pink");
              setState(() {
                _color = _color == Colors.pink ? Colors.orange : Colors.pink;
                _radius = _radius == 0 ? _dimension : 0;
                _dimension = _dimension == 200 ? 80 : 200;
              });
              // action
            },
          ),
        ],
      )),
    );
  }
}
