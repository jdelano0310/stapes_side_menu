import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/archivelist.dart';
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
        await rootBundle.loadString('data/aboutJoeOtherSites.json');
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
          Row(
            children: [
              paragraph('Named '),
              const Text(
                ' 2021 GPI Best Podcast,',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(1, 191, 157, 65)),
              ),
              const Text(' click '),
              const URLData(
                  url:
                      'https://www.youtube.com/watch?v=E4bYuqnDXVE?autoplay=1&start=5500&end=5620',
                  displayText: 'here '),
              const Text('to watch Joe\'s acceptance speech')
            ],
          ),
          const SizedBox(height: 15),
          paragraph('Websites where you can find more info', isbold: true),
          archivelist("", _otherSites),
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
