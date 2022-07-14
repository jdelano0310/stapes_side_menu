import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      ? Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Row(
            children: const [
              Text(
                'Upcoming Stand-up dates',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
              ),
            ],
          ),
          Row(
            children: const [
              Text(
                'Catch Joe entertaining the masses with his stand-up routine!',
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
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
                    Text(item['date-time']),
                    Text(item['establishment']),
                    const Text('Tickets')
                  ],
                  decoration: int.parse(item['row']) % 2 == 0
                      ? const BoxDecoration(color: Colors.white)
                      : BoxDecoration(color: Colors.grey[200]))
          ])
        ])
      : const Text("nothing to put here");
}
