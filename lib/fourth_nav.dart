import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FourthNav extends StatefulWidget {
  final double w;

  const FourthNav({Key key, this.w}) : super(key: key);
  @override
  _FourthNavState createState() => _FourthNavState();
}

class _FourthNavState extends State<FourthNav> {
  List<Nav4ItemClass> items4 = List<Nav4ItemClass>();
  int pos = 0;

  @override
  void initState() {
    super.initState();

    items4.add(Nav4ItemClass(true, 'assets/svg/home4.svg', 'Home', 0));
    items4.add(Nav4ItemClass(false, 'assets/svg/codepen.svg', 'Codepen', 1));
    items4.add(Nav4ItemClass(false, 'assets/svg/edit.svg', 'Edit', 2));
    items4.add(Nav4ItemClass(false, 'assets/svg/folder.svg', 'Folder', 3));
    items4.add(Nav4ItemClass(false, 'assets/svg/man.svg', 'Profile', 4));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: widget.w - 48,
        height: 84,
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(0.0, 8.0),
              blurRadius: 10,
            ),
          ],
        ),
        child: Stack(
          children: <Widget>[
            AnimatedPositioned(
              duration: Duration(milliseconds: 600),
              curve: Curves.bounceOut,
              top: 0,
              left: ((widget.w - 60) / 5) * pos,
              child: Container(
                width: ((widget.w - 60) / 5),
                height: ((widget.w - 60) / 5),
                child: Center(
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff13E147),
                          Color(0xff2C86E0),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(72),
                    ),
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              curve: Curves.bounceOut,
              top: 0,
              left: ((widget.w - 60) / 5) * pos,
              child: Container(
                width: ((widget.w - 60) / 5),
                height: ((widget.w - 60) / 5),
                child: Center(
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    width: ((widget.w - 60) / 5),
                    height: ((widget.w - 60) / 5),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff13E147),
                          Color(0xff2C86E0),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(72),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: items4.map((i) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      items4.forEach((item) => item.isOpen = false);
                      i.isOpen = !i.isOpen;
                      pos = i.pos;
                    });
                  },
                  child: Nav4Item(
                    w: widget.w,
                    item: i,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class Nav4ItemClass {
  bool isOpen;
  String icon;
  String title;
  int pos;

  Nav4ItemClass(this.isOpen, this.icon, this.title, this.pos);
}

class Nav4Item extends StatelessWidget {
  final double w;
  final Nav4ItemClass item;

  const Nav4Item({Key key, this.w, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (w - 60) / 5,
      height: 72,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: item.isOpen ? 30 : 24,
            height: item.isOpen ? 30 : 24,
            child: SvgPicture.asset(
              item.icon,
              fit: BoxFit.cover,
              color: item.isOpen ? Colors.white : Colors.grey,
            ),
          ),
          item.isOpen
              ? Text(
                  item.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    height: 1.8,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
