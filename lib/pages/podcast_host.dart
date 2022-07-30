import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/urllist.dart';
import '/widgets/widgets.dart';

class PodcastHost extends StatefulWidget {
  const PodcastHost({Key? key}) : super(key: key);

  @override
  State<PodcastHost> createState() => _PodcastHost();
}

class _PodcastHost extends State<PodcastHost> {
  List _otherSites = [];

  @override
  void initState() {
    readJson();

    super.initState();
  }

  Future<void> readJson() async {
    final String respArchivesHost =
        await rootBundle.loadString('data/pokerintheears.json');
    final dataOtherSites = await json.decode(respArchivesHost);

    setState(() {
      _otherSites = dataOtherSites["items"];
    });
  }

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    return SingleChildScrollView(
      controller: scrollController,
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const DisplayTitle(
            title: 'Poker in the ears',
            subtitle:
                'The long running Pokerstars podcast formerly known as EPT not live. Available most Thursdays.',
          ),
          paragraph(
              'Every week, the hosts of PokerStars TV (James Hartigan and Joe Stapleton) bring you a behind-the-scenes look at what it’s like being two regular folks on the international poker circuit. Told from the perspective of a cranky British dad (Hartigan) and an undateable American bachelor (Stapes), ‘Poker in the Ears’ is a mostly uncensored take on the world of professional poker. The hosts also regularly call in favours, in the form of guest spots from their big-shot celebrity poker-playing friends. And they routinely hold on-air competitions, providing chances for listeners to join them on tour.'),
          Padding(
            padding:
                const EdgeInsets.only(left: 25, top: 15, bottom: 15, right: 25),
            child: SizedBox(
              width: double.infinity,
              child: Wrap(
                alignment: WrapAlignment.start,
                children: const [
                  Text('Named '),
                  Text(
                    ' 2021 GPI Best Podcast,',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 191, 157, 65)),
                  ),
                  Text(' click '),
                  URLData(
                    url:
                        'https://www.youtube.com/watch?v=E4bYuqnDXVE?autoplay=1&start=4897&end=5026',
                    displayText: 'here ',
                  ),
                  Text('to watch Joe\'s acceptance speech'),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ),
          urllist("Some services you can find it on", _otherSites),
        ],
      ),
    );
  }
}

Row paragraph(contents, {isbold = false}) {
  return Row(
    children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, top: 8, right: 25),
          child: !isbold
              ? Text(contents)
              : Text(contents,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
      )
    ],
  );
}
