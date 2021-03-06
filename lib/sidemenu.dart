import 'package:flutter/material.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';

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
        backgroundColor: const Color.fromARGB(255, 54, 64, 80),
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
          priority: 5,
          title: 'About Joe',
          onTap: () {
            widget.page.jumpToPage(5);
          },
          icon: const Icon(Icons.history),
        ),
        SideMenuItem(
          priority: 6,
          title: 'Highlights',
          onTap: () {
            widget.page.jumpToPage(6);
          },
          icon: const Icon(Icons.highlight),
        ),
        SideMenuItem(
          priority: 7,
          title: 'Archive',
          onTap: () {
            widget.page.jumpToPage(7);
          },
          icon: const Icon(Icons.archive),
        ),
      ],
    );
  }
}

Widget textInforArea() {
  return Container(
    width: 200,
    height: 50,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
      color: Color.fromARGB(255, 42, 49, 61),
    ),
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
