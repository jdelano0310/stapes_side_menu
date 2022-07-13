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
      ? Column(children: [
          const Text('Stand-up Dates'),
          Table(border: TableBorder.all(color: Colors.black), columnWidths: {
            0: FixedColumnWidth(100.0),
            1: FixedColumnWidth(100.0),
            2: FixedColumnWidth(100.0)
          }, children: [
            for (var item in standupDates)
              TableRow(children: [
                Text(item['date-time']),
                Text(item['establishment']),
                Text('Tickets')
              ])
          ])
        ])
      : const Text("nothing to put here");
}
