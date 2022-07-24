import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/widgets/latestcard.dart';

class PodcastGuest extends StatefulWidget {
  const PodcastGuest({Key? key}) : super(key: key);

  @override
  State<PodcastGuest> createState() => _PodcastGuest();
}

class _PodcastGuest extends State<PodcastGuest> {
  List _podCastGuesItems = [];

  @override
  void initState() {
    readJson();

    super.initState();
  }

  // Fetch content from the json file
  Future<void> readJson() async {
    final String respLatest =
        await rootBundle.loadString('data/asPodcastGuest.json');
    final dataLatest = await json.decode(respLatest);

    setState(() {
      _podCastGuesItems = dataLatest["items"];
    });
  }

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            theLatestItems(_podCastGuesItems),
          ),
        )
      ],
    );
  }
}

List<Container> theLatestItems(theLatestItems) {
  return List.generate(
    theLatestItems.length,
    (index) => Container(
      padding: const EdgeInsets.all(8.0),
      color: Colors.grey[300],
      child: thelatestcard(theLatestItems[index]),
    ),
  );
}
