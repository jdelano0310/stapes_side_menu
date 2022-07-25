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
