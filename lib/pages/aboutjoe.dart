import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/archivelist.dart';
import '/widgets/widgets.dart';

class AboutJoe extends StatefulWidget {
  const AboutJoe({Key? key}) : super(key: key);

  @override
  State<AboutJoe> createState() => _AboutJoeState();
}

class _AboutJoeState extends State<AboutJoe> {
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const DisplayTitle(
          title: 'About Joe “Stapes” Stapleton',
          subtitle: 'Born: October 6, 1982 in upstate New York',
        ),
        paragraph('Pre-Poker', isbold: true),
        paragraph(
            'Joe grew up in upstate New York in Albany. After graduating high school, he decided on Boston University and headed out to college at 17 years old.'),
        paragraph(
            'He graduated after 3 years and 5 days after moved to Los Angeles at age 20 to be a writer. Where he landed his first job at MADtv in 2002 as a Production Assistant and eventually became a Production Coordinator by 2004.'),
        const SizedBox(height: 15),
        paragraph('Here comes Poker', isbold: true),
        paragraph(
            'In 2005, his best friend got an internship with Card Player magazine and was going to Vegas to cover the WSOP. Joe was asked to drive his friend, which he did, upon arriving Card Player asked his friend if he knew of anyone else that could write. His friend answered yes and so Joe’s poker career was born.'),
        paragraph(
            'In 2006, he returned to Vegas and Card Player magazine, though not as a writer but as a video producer. This, however, did not work out.'),
        paragraph(
            'In 2007, Full Tilt Poker decided to create a podcast, though they weren’t called podcasts then, called PokerWire Radio. Joe joined Joe Sebok and the late Gavin Smith as hosts of the show. He kept his job at MADtv through most of the run until he was offered a full-time position hosting, executive producing, and overall make it his own with that he left MADtv.'),
        paragraph(
            'In 2011, The Unlawful Internet Gambling Enforcement Act was enforced on the online poker world and that was the end of PokerWire Radio.'),
        const SizedBox(height: 15),
        paragraph('Websites where you can find more info', isbold: true),
        archivelist("", _otherSites),
      ],
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

class OtherSite {
  String title;
  String urltitle;
  String url;

  OtherSite(this.title, this.urltitle, this.url);

  @override
  String toString() {
    return '{ $title, $urltitle, $url }';
  }
}
