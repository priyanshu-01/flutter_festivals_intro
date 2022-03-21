import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_festivals_intro/constants/animation_constants.dart';

class Carousel extends StatefulWidget {
  final List<String>? animations;
  final PageController? pageController;

  const Carousel({
    Key? key,
    @required this.animations,
    @required this.pageController,
  }) : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int? _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
  }

  @override
  Widget build(context) {
    return PageView.builder(
      onPageChanged: (value) {
        setState(() {
          _currentPage = value;
        });
      },
      itemCount: animations.length,
      controller: widget.pageController,
      itemBuilder: (context, index) {
        return Column(
          children: [
            const Expanded(
              child: SizedBox(),
            ),
            SizedBox(
              height: 100,
              child: Center(
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: index == _currentPage ? 1.0 : 0.5,
                  child: Text(
                    widget.animations![index % widget.animations!.length],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: index == _currentPage ? 16 : 14,
                      fontWeight: index == _currentPage
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
