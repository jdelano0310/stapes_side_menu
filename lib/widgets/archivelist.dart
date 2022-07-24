import 'package:flutter/material.dart';
import '/widgets/widgets.dart';
import '/widgets/bulletlist.dart';

Widget archivelist(list) {
  // Display the data loaded from sample.json
  return list.isNotEmpty
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
                        'Stapes archive',
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
                        'Here you will find links to older podcasts as a host/guest, articles, and other stuff we find about Joe',
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
                child: BulletList(widgets: bulletItems(list)),
              )
            ]),
          ),
        )
      : const Text("nothing to put here");
}

List<Widget> bulletItems(list) {
  List<Widget> bulletitems = <Widget>[];
  for (var item in list) {
    bulletitems.add(Row(
      children: [
        Text(item["title"]),
        URLData(url: item["url"], displayText: item["urltext"]),
      ],
    ));
  }
  return bulletitems;
}
