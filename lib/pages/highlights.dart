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
    });
  }

  List<String> findDistinctSections(list) {
    // loop the passed json list and find each of the different section names contained
    String currentSection = '';
    List<String> sections = [];
    for (var item in list) {
      if (item['section'].toString() != currentSection) {
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
        urllist(_highlights, _sections),
      ]),
    );
  }
}

Widget urllist(list, sections) {
  // Display the data loaded from sample.json
  return list.isNotEmpty
      ? Column(children: [
          for (var section in sections)
            BulletList(widgets: bulletItems(list, section), listTitle: section),
        ])
      : const Text("");
}

// create a list of just those items that have the matching section value
List<Widget> bulletItems(list, section) {
  debugPrint('getting items for $section');
  List<Widget> bulletitems = <Widget>[];
  for (var item in list) {
    if (item['section'] == section) {
      bulletitems.add(Row(
        children: [
          Expanded(
              child: URLData(url: item["url"], displayText: item["urltext"])),
        ],
      ));
    }
  }

  return bulletitems;
}
