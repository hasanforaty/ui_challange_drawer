import 'dart:math';

import 'package:flutter/material.dart';

import '../widgets/drawer_widget.dart';
import '../widgets/home_widgets.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> with TickerProviderStateMixin {
  late AnimationController animationController;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget? _) {
        var maxSide = MediaQuery.of(context).size.width;
        return GestureDetector(
          onTap: _toggle,
          child: Stack(
            children: [
              Transform.translate(
                offset:
                    Offset(((maxSide * (animationController.value - 1))), 0),
                child: Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY((pi / 2 * (1 - animationController.value))),
                    alignment: Alignment.centerRight,
                    child: const MyDrawer(
                      width: 200,
                    )),
              ),
              Transform.translate(
                offset: Offset((maxSide * animationController.value / 2), 0),
                child: Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY((-pi / 2 * animationController.value)),
                    alignment: Alignment.centerLeft,
                    child: const MyHomeWidgets(title: "drawer Challenge")),
              ),
            ],
          ),
        );
      },
    );
  }

  void _toggle() => animationController.isCompleted
      ? animationController.reverse()
      : animationController.forward();

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
