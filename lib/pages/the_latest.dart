import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import '/widgets/latestcard.dart';
import '/widgets/standupdates.dart';
import 'dart:math' as math;

final log = Logger('ExampleLogger');

class TheLatest extends StatefulWidget {
  const TheLatest({Key? key}) : super(key: key);

  @override
  State<TheLatest> createState() => _TheLatest();
}

class _TheLatest extends State<TheLatest> {
  List _standupItems = [];
  List _theLatestItems = [];

  @override
  void initState() {
    readJson();

    super.initState();
  }

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('data/standupdates.json');
    final data = await json.decode(response);

    final String respLatest =
        await rootBundle.loadString('data/thelatest.json');
    final dataLatest = await json.decode(respLatest);

    setState(() {
      _standupItems = data["items"];
      _theLatestItems = dataLatest["items"];
    });
  }

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate: _SliverAppBarDelegate(
            minHeight: 200,
            maxHeight: 400,
            child: standupdates(_standupItems),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            theLatestItems(_theLatestItems),
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
