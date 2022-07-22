import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/widgets/latestcard.dart';
import 'dart:math' as math;

class ReadAllAboutHim extends StatefulWidget {
  const ReadAllAboutHim({Key? key}) : super(key: key);

  @override
  State<ReadAllAboutHim> createState() => _ReadAllAboutHim();
}

class _ReadAllAboutHim extends State<ReadAllAboutHim> {
  List _podCastGuesItems = [];

  @override
  void initState() {
    readJson();

    super.initState();
  }

  // Fetch content from the json file
  Future<void> readJson() async {
    final String respLatest =
        await rootBundle.loadString('data/readAllAboutHim.json');
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

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
