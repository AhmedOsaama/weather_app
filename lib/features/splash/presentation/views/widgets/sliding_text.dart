import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  final Animation<Offset> slidingAnimation;
  const SlidingText({Key? key, required this.slidingAnimation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(position: slidingAnimation, child: const Text('Read Weather Forecast', textAlign: TextAlign.center,));
        }
    );
  }
}