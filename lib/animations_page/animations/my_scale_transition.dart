import 'package:flutter/material.dart';

class MyScaleTransition extends StatefulWidget {
  final AnimationController? animationController;

  const MyScaleTransition({
    Key? key,
    @required this.animationController,
  }) : super(key: key);

  @override
  _MyScaleTransitionState createState() => _MyScaleTransitionState();
}

class _MyScaleTransitionState extends State<MyScaleTransition> {
  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: widget.animationController!,
        curve: Curves.fastOutSlowIn,
      ),
      alignment: Alignment.center,
      child: const FlutterLogo(
        size: 100,
      ),
    );
  }
}
