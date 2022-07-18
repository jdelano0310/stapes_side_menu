import 'package:flutter/material.dart';
import 'package:stapes_side_menu/widgets/widgets.dart';
import '/models/latestitem.dart';

Widget thelatestcard(theLatestItem) {
  var item = LatestItem.fromJson(theLatestItem);

  return Center(
    child: Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(item.url.indexOf('twitch') > 0 ||
                    item.url.indexOf('youtube') > 0
                ? Icons.video_file
                : Icons.newspaper),
            title: URLData(
                url: item.url, displayText: '${item.title}   ${item.date}'),
            subtitle: Text(item.subtitle),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ConstrainedBox(
                  constraints:
                      const BoxConstraints(maxHeight: 300, minWidth: 560),
                  child: Image.asset(
                    'images/${item.image}',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(item.excerpt),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
