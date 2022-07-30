import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/bulletlist.dart';
import '../widgets/widgets.dart';

class Highlights extends StatefulWidget {
  const Highlights({Key? key}) : super(key: key);

  @override
  State<Highlights> createState() => _Highlights();
}

class _Highlights extends State<Highlights> {
  List _highlights = [];
  List<String> _sections = [];

  @override
  void initState() {
    readJson();
    super.initState();
  }

  // Fetch content from the json file
  Future<void> readJson() async {
    final String respHighlights =
        await rootBundle.loadString('data/highlights.json');
    final data = await json.decode(respHighlights);

    setState(() {
      _highlights = data["items"];
      _sections = findDistinctSections(_highlights);
      debugPrint(_sections.toString());
    });
  }

  List<String> findDistinctSections(list) {
    // loop the passed json list and find each of the different section names contained
    String currentSection = '';
    List<String> sections = [];
    for (var item in list) {
      debugPrint(item['section']);
      if (item['section'].toString() != currentSection) {
        debugPrint(currentSection);
        sections.add(item['section']);
        currentSection = item['section'];
      }
    }
    return sections;
  }

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    return SingleChildScrollView(
      controller: scrollController,
      scrollDirection: Axis.vertical,
      child: Column(children: [
        const DisplayTitle(
          title: 'Highlights',
          subtitle: 'Things we found funny, poignant, or noteworthy',
        ),
        urllist("", _highlights),
      ]),
    );
  }
}

Widget urllist(String title, list) {
  // Display the data loaded from sample.json
  return list.isNotEmpty
      ? Column(children: [
          BulletList(widgets: bulletItems(list), listTitle: title),
        ])
      : const Text("");
}

// this is used by the About Joe page as well which doesn't have a title for the list, thus the check for blank
List<Widget> bulletItems(list) {
  List<Widget> bulletitems = <Widget>[];
  for (var item in list) {
    bulletitems.add(Row(
      children: [
        !(item["title"] == '')
            ? Expanded(child: Text(item["title"]))
            : const SizedBox(width: 1),
        const SizedBox(
          width: 5,
        ),
        Expanded(
            child: URLData(url: item["url"], displayText: item["urltext"])),
      ],
    ));
  }

  return bulletitems;
}
