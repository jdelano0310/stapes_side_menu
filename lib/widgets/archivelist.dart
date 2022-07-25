import 'package:flutter/material.dart';
import '/widgets/widgets.dart';
import '/widgets/bulletlist.dart';

Widget archivelist(String title, list) {
  // Display the data loaded from sample.json
  return list.isNotEmpty
      ? Column(children: [
          BulletList(widgets: bulletItems(list), listTitle: title),
        ])
      : const Text("");
}

List<Widget> bulletItems(list) {
  List<Widget> bulletitems = <Widget>[];
  for (var item in list) {
    bulletitems.add(Row(
      children: [
        Expanded(child: Text(item["title"])),
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
