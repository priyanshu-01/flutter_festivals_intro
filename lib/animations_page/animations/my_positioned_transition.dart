import 'dart:ui';
import 'package:flutter/material.dart';

class MyPositionedTransition extends StatefulWidget {
  final AnimationController? animationController;

  const MyPositionedTransition({
    Key? key,
    @required this.animationController,
  }) : super(key: key);

  @override
  State<MyPositionedTransition> createState() => _MyPositionedTransitionState();
}

class _MyPositionedTransitionState extends State<MyPositionedTransition> {
  double smallLogo = 100;
  double bigLogo = 200;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final Size biggest = constraints.biggest;
        return Stack(
          children: <Widget>[
            PositionedTransition(
              rect: RelativeRectTween(
                begin: RelativeRect.fromSize(
                    Rect.fromLTWH(0, 0, smallLogo, smallLogo), biggest),
                end: RelativeRect.fromSize(
                    Rect.fromLTWH(biggest.width - bigLogo,
                        biggest.height - bigLogo, bigLogo, bigLogo),
                    biggest),
              ).animate(CurvedAnimation(
                parent: widget.animationController!,
                curve: Curves.elasticInOut,
              )),
              child: const Padding(
                  padding: EdgeInsets.all(8), child: FlutterLogo()),
            ),
          ],
        );
      },
    );
  }
}
