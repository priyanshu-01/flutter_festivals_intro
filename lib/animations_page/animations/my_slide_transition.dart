import 'dart:ui';
import 'package:flutter/material.dart';

class MySlideTransition extends StatefulWidget {
  final AnimationController? animationController;

  const MySlideTransition({
    Key? key,
    @required this.animationController,
  }) : super(key: key);

  @override
  State<MySlideTransition> createState() => _MySlideTransitionState();
}

class _MySlideTransitionState extends State<MySlideTransition> {
  late Tween<Offset> positionTween;
  late Animation<Offset> animation;
  @override
  void initState() {
    positionTween = Tween<Offset>(
      begin: const Offset(2.5, 0.0),
      end: const Offset(0.0, 0.0),
    );
    animation = positionTween.animate(CurvedAnimation(
      parent: widget.animationController!,
      curve: Curves.elasticInOut,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation,
      child: const FlutterLogo(
        size: 100,
      ),
    );
  }
}
