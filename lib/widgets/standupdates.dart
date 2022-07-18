import 'package:flutter/material.dart';
import '/widgets/widgets.dart';

Widget standupdates(standupDates) {
  // Display the data loaded from sample.json
  return standupDates.isNotEmpty
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
                        'Upcoming Stand-up dates',
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
                        'Catch Joe entertaining the masses with his stand-up routine!',
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
                child: Table(columnWidths: const {
                  0: FlexColumnWidth(.33),
                  1: FlexColumnWidth(.33),
                  2: FlexColumnWidth(.33),
                }, children: [
                  for (var item in standupDates)
                    TableRow(
                        children: [
                          TableCellPadded(child: Text(item['date-time'])),
                          TableCellPadded(
                            child: URLData(
                              displayText: item['establishment'],
                              url: item['url'],
                            ),
                          ),
                          TableCellPadded(
                            child: URLData(
                              displayText: 'Tickets',
                              url: item['ticket-url'],
                            ),
                          )
                        ],
                        decoration: int.parse(item['row']) % 2 == 0
                            ? const BoxDecoration(color: Colors.white)
                            : BoxDecoration(color: Colors.grey[200]))
                ]),
              )
            ]),
          ),
        )
      : const Text("nothing to put here");
}
