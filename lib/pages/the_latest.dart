import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/link.dart';

class TheLatest extends StatefulWidget {
  const TheLatest({Key? key}) : super(key: key);

  @override
  State<TheLatest> createState() => _TheLatest();
}

class _TheLatest extends State<TheLatest> {
  List _items = [];

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
    setState(() {
      _items = data["items"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return standupdates(_items);
  }
}

Widget standupdates(standupDates) {
  // Display the data loaded from sample.json
  return standupDates.isNotEmpty
      ? Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Upcoming Stand-up dates',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
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
            Table(columnWidths: const {
              0: FlexColumnWidth(.33),
              1: FlexColumnWidth(.33),
              2: FlexColumnWidth(.33),
            }, children: [
              for (var item in standupDates)
                TableRow(
                    children: [
                      TableCellPadded(child: Text(item['date-time'])),
                      TableCellPadded(child: Text(item['establishment'])),
                      TableCellPadded(
                        child: Link(
                          uri: Uri.parse(item['ticket-url']),
                          builder: (context, followLink) => MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: followLink,
                              child: const Text(
                                'Tickets',
                                style: TextStyle(
                                  color: Colors.red,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                    decoration: int.parse(item['row']) % 2 == 0
                        ? const BoxDecoration(color: Colors.white)
                        : BoxDecoration(color: Colors.grey[200]))
            ])
          ]),
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
