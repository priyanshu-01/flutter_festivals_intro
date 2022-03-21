import 'package:flutter/material.dart';

class WelocomePage extends StatefulWidget {
  @override
  State<WelocomePage> createState() => _WelocomePageState();
}

class _WelocomePageState extends State<WelocomePage> {
  Color _color = Colors.pink;
  double _height = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 2),
              color: _color,
              height: _height,
              width: 100,
            ),
            TextButton(
              onPressed: () {
                _height = 200;
                _color = Colors.orange;
                setState(() {});
              },
              child: Text("Change color"),
            )
          ],
        ),
      ),
    );
  }
}
