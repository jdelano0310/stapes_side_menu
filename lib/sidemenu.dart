import 'package:flutter/material.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:rounded_background_text/rounded_background_text.dart';

class MySideMenu extends StatefulWidget {
  final PageController page;
  const MySideMenu({Key? key, required this.page}) : super(key: key);

  @override
  State<MySideMenu> createState() => _MySideMenuState();
}

class _MySideMenuState extends State<MySideMenu> {
  @override
  Widget build(BuildContext context) {
    return SideMenu(
      controller: widget.page,
      // onDisplayModeChanged: (mode) {
      //   print(mode);
      // },
      style: SideMenuStyle(
        openSideMenuWidth: 250,
        displayMode: SideMenuDisplayMode.auto,
        hoverColor: const Color.fromARGB(255, 6, 49, 85),
        selectedColor: const Color.fromARGB(255, 6, 49, 85),
        selectedTitleTextStyle: const TextStyle(color: Colors.white),
        unselectedTitleTextStyle: const TextStyle(color: Colors.blueGrey),
        selectedIconColor: Colors.white,
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.all(Radius.circular(10)),
        // ),
        backgroundColor: const Color.fromARGB(255, 4, 59, 85),
      ),
      title: Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 150,
              maxWidth: 150,
            ),
            child: Image.asset(
              'images/headshot.png',
            ),
          ),
          const Divider(
            indent: 8.0,
            endIndent: 8.0,
          ),
        ],
      ),
      footer: textInforArea(),
      items: [
        SideMenuItem(
          priority: 0,
          title: 'The Latest',
          onTap: () {
            widget.page.jumpToPage(0);
          },
          icon: const Icon(Icons.home),
        ),
        SideMenuItem(
          priority: 1,
          title: 'Podcast Host',
          onTap: () {
            widget.page.jumpToPage(1);
          },
          icon: const Icon(Icons.supervisor_account),
        ),
        SideMenuItem(
          priority: 2,
          title: 'Podcast Guest',
          onTap: () {
            widget.page.jumpToPage(2);
          },
          icon: const Icon(Icons.supervisor_account),
        ),
        SideMenuItem(
          priority: 3,
          title: 'Articles',
          onTap: () {
            widget.page.jumpToPage(3);
          },
          icon: const Icon(Icons.newspaper),
        ),
        SideMenuItem(
          priority: 4,
          title: 'TV and Movies',
          onTap: () {
            widget.page.jumpToPage(4);
          },
          icon: const Icon(Icons.tv),
        ),
        SideMenuItem(
          priority: 6,
          title: 'About Joe',
          onTap: () async {},
          icon: const Icon(Icons.history),
        ),
        SideMenuItem(
          priority: 6,
          title: 'Highlights',
          onTap: () async {},
          icon: const Icon(Icons.highlight),
        ),
        SideMenuItem(
          priority: 6,
          title: 'Archive',
          onTap: () async {},
          icon: const Icon(Icons.archive),
        ),
      ],
    );
  }
}

Text textInformationArea() {
  return Text(
    'An unofficial fan site for all, well most, things Stapes.',
    textAlign: TextAlign.center,
    style: TextStyle(
      background: Paint()
        ..color = const Color.fromARGB(255, 6, 49, 85)
        ..strokeWidth = 15
        ..strokeJoin = StrokeJoin.round
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke,
      color: Colors.grey,
    ),
  );
}

RoundedBackgroundText rndtext() {
  return RoundedBackgroundText(
    'An unofficial fan site for all\nwell most, things Stapes.',
    style: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: Colors.grey,
    ),
    backgroundColor: const Color.fromARGB(255, 6, 49, 85),
  );
}

Widget textInforArea() {
  return Container(
    width: 200,
    height: 50,
    color: const Color.fromARGB(255, 6, 49, 85),
    child: const Center(
      child: Text(
        'An unofficial fan site for all, well most, things Stapes.',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    ),
  );
}
