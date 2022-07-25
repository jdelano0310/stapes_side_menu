import 'package:flutter/material.dart';
import 'package:stapes_side_menu/pages/the_latest.dart';
import 'package:stapes_side_menu/pages/podcast_guest.dart';
import 'package:stapes_side_menu/pages/read_all_about_him.dart';

import 'pages/aboutjoe.dart';
import 'pages/archives.dart';

class MyPageArea extends StatefulWidget {
  final PageController page;
  const MyPageArea({Key? key, required this.page}) : super(key: key);

  @override
  State<MyPageArea> createState() => _MyPageAreaState();
}

class _MyPageAreaState extends State<MyPageArea> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView(
        controller: widget.page,
        children: const [
          TheLatest(),
          Text('Podcast Host'),
          PodcastGuest(),
          ReadAllAboutHim(),
          Text('TV & Movies'),
          AboutJoe(),
          Text('Highlights'),
          Archives()
        ],
      ),
    );
  }
}
