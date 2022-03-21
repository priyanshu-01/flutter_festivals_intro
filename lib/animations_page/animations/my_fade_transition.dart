import 'package:flutter/material.dart';

class MyFadeTransition extends StatefulWidget {
  final AnimationController? animationController;

  const MyFadeTransition({
    Key? key,
    @required this.animationController,
  }) : super(key: key);

  @override
  _MyFadeTransitionState createState() => _MyFadeTransitionState();
}

class _MyFadeTransitionState extends State<MyFadeTransition> {
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: widget.animationController!,
        curve: Curves.easeOut,
      ),
      child: const FlutterLogo(
        size: 100,
      ),
    );
  }
}
