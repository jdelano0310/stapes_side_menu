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
      ? Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: standupDates.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: index % 2 == 0 ? Colors.grey : Colors.white,
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      leading: Text(standupDates[index]["date-time"]),
                      title: Text(standupDates[index]["establishment"]),
                      subtitle: const Text("Tickets"),
                    ),
                  );
                },
              ),
            ),
          ],
        )
      : const Text("nothing to put here");
}
