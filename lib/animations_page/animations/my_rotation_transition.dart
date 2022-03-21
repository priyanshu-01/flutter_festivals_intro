import 'package:flutter/material.dart';

class MyRotationTransition extends StatefulWidget {
  final AnimationController? animationController;

  const MyRotationTransition({
    Key? key,
    @required this.animationController,
  }) : super(key: key);

  @override
  _MyRotationTransitionState createState() => _MyRotationTransitionState();
}

class _MyRotationTransitionState extends State<MyRotationTransition> {
  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: CurvedAnimation(
        parent: widget.animationController!,
        curve: Curves.elasticOut,
      ),
      alignment: Alignment.center,
      child: const FlutterLogo(
        size: 100,
      ),
    );
  }
}
