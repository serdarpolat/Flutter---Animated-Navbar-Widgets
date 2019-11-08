import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const Color blue = Color(0xff3b9eff);
const Color orange = Color(0xfff35c34);
const Color purple = Color(0xff6500ff);
const Color yellow = Color(0xfff2d300);
const Color blueLight = Color(0xff9f00f2);

class SecondNav extends StatefulWidget {
  final double w;

  const SecondNav({Key key, this.w}) : super(key: key);
  @override
  _SecondNavState createState() => _SecondNavState();
}

class _SecondNavState extends State<SecondNav> {
  List<Nav2ItemClass> items = List<Nav2ItemClass>();
  bool isOpen = false;

  @override
  void initState() {
    super.initState();

    items.add(Nav2ItemClass(false, 'assets/svg/home.svg', blue));
    items.add(Nav2ItemClass(false, 'assets/svg/trophy.svg', orange));
    items.add(Nav2ItemClass(false, 'assets/svg/plus.svg', purple));
    items.add(Nav2ItemClass(false, 'assets/svg/search.svg', yellow));
    items.add(Nav2ItemClass(false, 'assets/svg/user.svg', blueLight));
  }

  @override
  Widget build(BuildContext context) {
    var navWidth = widget.w - 48;
    return Center(
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              width: navWidth,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              width: navWidth,
              height: 128,
              padding: EdgeInsets.only(left: 12, right: 12),
              child: Row(
                children: items.map((i) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        items.forEach((el) => el.isOpen = false);
                        i.isOpen = true;
                      });
                    },
                    child: Nav2Item(item: i, navWidth: navWidth),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Nav2ItemClass {
  bool isOpen;
  String iconPath;
  Color color;

  Nav2ItemClass(this.isOpen, this.iconPath, this.color);
}

class Nav2Item extends StatelessWidget {
  const Nav2Item({
    Key key,
    @required this.item,
    @required this.navWidth,
  }) : super(key: key);

  final Nav2ItemClass item;
  final double navWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (navWidth - 24) / 5,
      height: 128,
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            curve: Curves.ease,
            top: item.isOpen ? -30 : 45,
            left: ((navWidth / 5) - (navWidth / 4.5)) / 2,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeOut,
              opacity: item.isOpen ? 1 : 0,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 100),
                width: item.isOpen ? navWidth / 4.5 : navWidth / 20,
                height: item.isOpen ? navWidth / 4.5 : navWidth / 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(navWidth / 5),
                  color: item.color,
                  boxShadow: [
                    BoxShadow(
                      color: item.color.withOpacity(0.6),
                      blurRadius: 10,
                      offset: Offset(0.0, 4.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeIn,
            top: item.isOpen ? -26 : 26,
            left: 0,
            child: Container(
              width: navWidth / 5,
              height: navWidth / 5,
              child: Center(
                child: Container(
                  width: 24,
                  height: 24,
                  child: SvgPicture.asset(
                    item.iconPath,
                    fit: BoxFit.cover,
                    color: item.isOpen ? Colors.white : item.color,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
