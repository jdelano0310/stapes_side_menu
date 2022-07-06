import 'package:flutter/material.dart';

class MyPageArea extends StatefulWidget {
  final PageController page;
  MyPageArea({Key? key, required this.page}) : super(key: key);

  @override
  State<MyPageArea> createState() => _MyPageAreaState();
}

class _MyPageAreaState extends State<MyPageArea> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView(
        controller: widget.page,
        children: [
          Container(
            color: Colors.white,
            child: const Center(
              child: Text(
                'Dashboard',
                style: TextStyle(fontSize: 35),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: const Center(
              child: Text(
                'Users',
                style: TextStyle(fontSize: 35),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: const Center(
              child: Text(
                'Files',
                style: TextStyle(fontSize: 35),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: const Center(
              child: Text(
                'Download',
                style: TextStyle(fontSize: 35),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: const Center(
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 35),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
