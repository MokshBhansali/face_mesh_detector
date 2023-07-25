import 'package:flutter/material.dart';

import 'face_mesh_detector_view.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  AnimationController? _animationController;
  Animation? _sizeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3500));
    _sizeAnimation = TweenSequence<double>(
      [
        TweenSequenceItem<double>(
            tween: Tween<double>(begin: 10, end: 300), weight: 200),
      ],
    ).animate(_animationController!);
    _animationController!.repeat(reverse: true);
    aftersplash();
  }

  aftersplash() async {
    await Future.delayed(const Duration(milliseconds: 4000));
    gotoHomePage();
  }

  gotoHomePage() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => FaceMeshDetectorView()));
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _sizeAnimation!,
          builder: (context, child) => InkWell(
            child: Image(
              image: const AssetImage('assets/images/icon.png'),
              height: _sizeAnimation!.value,
              width: _sizeAnimation!.value,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
