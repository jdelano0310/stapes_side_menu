import 'package:flutter/material.dart';

class BulletList extends StatelessWidget {
  final List<Widget> widgets;
  final String listTitle;

  const BulletList({Key? key, required this.widgets, required this.listTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(left: 25, bottom: 8.0),
        child: Text(
          listTitle,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widgets.map((w) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '\u2022',
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.55,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Container(
                    child: w,
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      )
    ]);
  }
}
