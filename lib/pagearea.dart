import 'package:flutter/material.dart';

class MyPageArea extends StatelessWidget {
  MyPageArea(page, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView(
        controller: page,
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
