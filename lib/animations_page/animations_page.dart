import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_festivals_intro/constants/animation_constants.dart';
import 'package:flutter_festivals_intro/utils/heading_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'animations/my_fade_transition.dart';
import 'animations/my_positioned_transition.dart';
import 'animations/my_rotation_transition.dart';
import 'animations/my_scale_transition.dart';
import 'animations/my_slide_transition.dart';
import 'carousel.dart';

class AnimationsPage extends StatefulWidget {
  const AnimationsPage({Key? key}) : super(key: key);

  @override
  State<AnimationsPage> createState() => _AnimationsPageState();
}

class _AnimationsPageState extends State<AnimationsPage>
    with SingleTickerProviderStateMixin {
  late PageController _controller;
  late AnimationController _animationController;
  late ValueNotifier<int> _currentAnimationIndex;

  @override
  void initState() {
    _currentAnimationIndex = ValueNotifier(0);
    _animationController = AnimationController(
      vsync: this,
      upperBound: 1.0,
      lowerBound: 0.0,
      // lowerBound: 0.6,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);
    _controller = PageController(
      viewportFraction: .5,
      initialPage: 0,
    );
    _controller.addListener(pageListener);
    super.initState();
  }

  pageListener() {
    _currentAnimationIndex.value =
        _controller.page!.floor() % animations.length;
  }

  @override
  void dispose() {
    _animationController.dispose();
    _controller.removeListener(pageListener);
    _controller.dispose();
    super.dispose();
  }

  final List<String> animations = <String>[
    // page1,
    // page2,
    scaleTransition,
    slideTransition,
    fadeTransition,
    rotationTransition,
    positionedTransition,
    // page3,
  ];

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Festivals'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ValueListenableBuilder<int>(
                    valueListenable: _currentAnimationIndex,
                    builder: (context, value, child) {
                      return getAnimatedChild(
                        animationController: _animationController,
                        animationType: animations[value],
                        // animationType: scaleTransition,
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
          Carousel(
            animations: animations,
            pageController: _controller,
          ),
        ],
      ),
    );
  }
}

Widget getAnimatedChild({
  required AnimationController animationController,
  required String animationType,
}) {
  switch (animationType) {
    case page1:
      return getHeadingText(
        "Wanna build some amazing mobile apps?",
      );
    case page2:
      return getHeadingText(
          "Here's a glimpse of some exciting animations Flutter has to offer..");
    case scaleTransition:
      return MyScaleTransition(
        animationController: animationController,
      );
    case slideTransition:
      return MySlideTransition(
        animationController: animationController,
      );
    case positionedTransition:
      return MyPositionedTransition(
        animationController: animationController,
      );
    case fadeTransition:
      return MyFadeTransition(
        animationController: animationController,
      );
    case rotationTransition:
      return MyRotationTransition(
        animationController: animationController,
      );
    case page3:
      return getHeadingText("Want to use them in your own mobile app?");

    default:
      return const Text("Error");
  }
}
