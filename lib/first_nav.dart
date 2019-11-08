import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Firstnav extends StatefulWidget {
  final double w;

  const Firstnav({Key key, this.w}) : super(key: key);
  @override
  _FirstnavState createState() => _FirstnavState();
}

class _FirstnavState extends State<Firstnav>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  List<bool> ics = List<bool>();

  Color bg = Color(0xff40404F);
  Color green = Color(0xff00D8A3).withOpacity(0.75);

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));

    animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOutBack,
        reverseCurve: Curves.easeInBack,
      ),
    );

    ics = [true, false, false, false];
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Container(
              width: widget.w - 48,
              height: 64,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        controller.reverse();
                        ics[0] = true;
                        ics[1] = false;
                        ics[2] = false;
                        ics[3] = false;
                      });
                    },
                    child: NavIcon(
                      isActive: ics[0],
                      iconPath: 'assets/svg/dash.svg',
                      iconPathAlt: 'assets/svg/dash_alt.svg',
                      colorGreen: green,
                      colorBg: bg,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        controller.reverse();
                        ics[0] = false;
                        ics[1] = true;
                        ics[2] = false;
                        ics[3] = false;
                      });
                    },
                    child: NavIcon(
                      isActive: ics[1],
                      iconPath: 'assets/svg/plane.svg',
                      iconPathAlt: 'assets/svg/plane_alt.svg',
                      colorGreen: green,
                      colorBg: bg,
                    ),
                  ),
                  Transform.rotate(
                    angle: -pi * (0.75 * animation.value),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          controller.forward();
                          ics[0] = false;
                          ics[1] = false;
                          ics[2] = true;
                          ics[3] = false;
                        });
                      },
                      child: Container(
                        width: 34,
                        height: 34,
                        child: SvgPicture.asset(
                          'assets/svg/plus.svg',
                          fit: BoxFit.cover,
                          color: ics[2] ? green : bg,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        controller.reverse();
                        ics[0] = false;
                        ics[1] = false;
                        ics[2] = false;
                        ics[3] = true;
                      });
                    },
                    child: NavIcon(
                      isActive: ics[3],
                      iconPath: 'assets/svg/heart.svg',
                      iconPathAlt: 'assets/svg/heart_alt.svg',
                      colorGreen: green,
                      colorBg: bg,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        controller.reverse();
                        ics[0] = false;
                        ics[1] = false;
                        ics[2] = false;
                        ics[3] = false;
                      });
                    },
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: AssetImage('assets/img/serdar.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class NavIcon extends StatelessWidget {
  final bool isActive;
  final String iconPath;
  final String iconPathAlt;
  final Color colorGreen;
  final Color colorBg;

  const NavIcon({
    Key key,
    this.isActive,
    this.iconPath,
    this.iconPathAlt,
    this.colorGreen,
    this.colorBg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          AnimatedPositioned(
            top: isActive ? 5 : 0,
            left: isActive ? -5 : 0,
            duration: Duration(milliseconds: 600),
            curve: Curves.elasticOut,
            child: Opacity(
              opacity: isActive ? 1 : 0,
              child: Container(
                width: 24,
                height: 24,
                child: SvgPicture.asset(
                  iconPathAlt,
                  fit: BoxFit.cover,
                  color: colorGreen,
                ),
              ),
            ),
          ),
          Container(
            width: 30,
            height: 30,
            child: SvgPicture.asset(
              iconPath,
              fit: BoxFit.cover,
              color: colorBg,
            ),
          ),
        ],
      ),
    );
  }
}
