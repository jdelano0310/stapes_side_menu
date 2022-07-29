import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/widgets.dart';
import '../widgets/urllist.dart';

class Highlights extends StatefulWidget {
  const Highlights({Key? key}) : super(key: key);

  @override
  State<Highlights> createState() => _Highlights();
}

class _Highlights extends State<Highlights> {
  List _archivesHost = [];

  @override
  void initState() {
    readJson();
    super.initState();
  }

  // Fetch content from the json file
  Future<void> readJson() async {
    final String respArchivesHost =
        await rootBundle.loadString('data/highlights.json');
    final dataArchivesHost = await json.decode(respArchivesHost);

    setState(() {
      _archivesHost = dataArchivesHost["items"];
    });
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
        urllist("As a podcast host", _archivesHost),
      ]),
    );
  }
}
