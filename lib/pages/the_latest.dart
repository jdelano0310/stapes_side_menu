import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:logging/logging.dart';
import 'package:url_launcher/link.dart';
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
            minHeight: 400,
            maxHeight: 400,
            child: standupdates(_standupItems),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(theLatestItems(_theLatestItems)),
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
      height: 120,
      child: thelatestcard(theLatestItems[index]),
    ),
  );
}

Widget thelatestcard(theLatestItem) {
  debugPrint(theLatestItem.toString());
  var item = LatestItem.fromJson(theLatestItem);

  return Center(
    child: Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.album),
            title: Text(item.title),
            subtitle: Text(item.subtitle),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('BUY TICKETS'),
                onPressed: () {/* ... */},
              ),
              const SizedBox(width: 2),
              TextButton(
                child: const Text('LISTEN'),
                onPressed: () {/* ... */},
              ),
              const SizedBox(width: 2),
            ],
          ),
        ],
      ),
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

Widget standupdates(standupDates) {
  // Display the data loaded from sample.json
  return standupDates.isNotEmpty
      ? Container(
          decoration: BoxDecoration(color: Colors.grey[100]),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Row(
                children: const [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Upcoming Stand-up dates',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Catch Joe entertaining the masses with his stand-up routine!',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Table(columnWidths: const {
                  0: FlexColumnWidth(.33),
                  1: FlexColumnWidth(.33),
                  2: FlexColumnWidth(.33),
                }, children: [
                  for (var item in standupDates)
                    TableRow(
                        children: [
                          TableCellPadded(child: Text(item['date-time'])),
                          TableCellPadded(
                            child: TableURLData(
                              displayText: item['establishment'],
                              url: item['url'],
                            ),
                          ),
                          TableCellPadded(
                            child: TableURLData(
                              displayText: 'Tickets',
                              url: item['ticket-url'],
                            ),
                          )
                        ],
                        decoration: int.parse(item['row']) % 2 == 0
                            ? const BoxDecoration(color: Colors.white)
                            : BoxDecoration(color: Colors.grey[200]))
                ]),
              )
            ]),
          ),
        )
      : const Text("nothing to put here");
}

class TableCellPadded extends StatelessWidget {
  final EdgeInsets? padding;
  final Widget child;
  final TableCellVerticalAlignment? verticalAlignment;

  const TableCellPadded(
      {Key? key, required this.child, this.padding, this.verticalAlignment})
      : super(key: key);

  @override
  TableCell build(BuildContext context) => TableCell(
      verticalAlignment: verticalAlignment ?? TableCellVerticalAlignment.middle,
      child: Padding(
          padding: padding ?? const EdgeInsets.all(10.0), child: child));
}

class TableURLData extends StatelessWidget {
  final String url;
  final String displayText;

  const TableURLData({super.key, required this.url, required this.displayText});

  @override
  Link build(BuildContext context) => Link(
        uri: Uri.parse(url),
        builder: (context, followLink) => MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: followLink,
            child: Text(
              displayText,
              style: TextStyle(
                color: HexColor('#c94663'),
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
      );
}

class LatestItem {
  final String row;
  final String date; // non-nullable
  final String title; // non-nullable
  final String subtitle; // non-nullable
  final String url; // non-nullable
  final String image; // non-nullable
  final String excerpt; // non-nullable

  LatestItem(this.row, this.date, this.title, this.subtitle, this.url,
      this.image, this.excerpt);

  LatestItem.fromJson(Map<String, dynamic> json)
      : row = json['row'],
        date = json['date'],
        title = json['title'],
        subtitle = json['subtitle'],
        url = json['url'],
        image = json['image'],
        excerpt = json['excerpt'];

  Map<String, dynamic> toJson() => {
        'row': row,
        'date': date,
        'title': title,
        'subtitle': subtitle,
        'url': url,
        'imagename': image,
        'excerpt': excerpt
      };
}
