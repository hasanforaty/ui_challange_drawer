import 'package:drawer_ui_challege/widgets/drawer_widget.dart';
import 'package:drawer_ui_challege/widgets/home_widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController animationController;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget? _) {
        var scale = 1 - (animationController.value * 0.3);
        var maxSide = MediaQuery.of(context).size.width;
        var side = (maxSide * (animationController.value * 0.6));
        return GestureDetector(
          onTap: _toggle,
          child: Stack(
            children: [
              MyDrawer(),
              Transform(
                  transform: Matrix4.identity()
                    ..translate(side)
                    ..scale(scale),
                  alignment: Alignment.centerLeft,
                  child: const MyHomeWidgets(title: "drawer Challenge")),
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
