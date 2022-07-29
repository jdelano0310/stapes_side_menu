import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/widgets.dart';
import '../widgets/urllist.dart';

class Archives extends StatefulWidget {
  const Archives({Key? key}) : super(key: key);

  @override
  State<Archives> createState() => _Archives();
}

class _Archives extends State<Archives> {
  List _archivesHost = [];
  List _archivesGuest = [];
  List _archivesArticles = [];

  @override
  void initState() {
    readJson();
    super.initState();
  }

  // Fetch content from the json file
  Future<void> readJson() async {
    final String respArchivesHost =
        await rootBundle.loadString('data/archiveAsHost.json');
    final dataArchivesHost = await json.decode(respArchivesHost);

    final String respArchivesGuest =
        await rootBundle.loadString('data/archiveAsGuest.json');
    final dataArchivesGuest = await json.decode(respArchivesGuest);

    final String respArchivesArticles =
        await rootBundle.loadString('data/archiveArticles.json');
    final dataArchivesArticles = await json.decode(respArchivesArticles);

    setState(() {
      _archivesHost = dataArchivesHost["items"];
      _archivesGuest = dataArchivesGuest["items"];
      _archivesArticles = dataArchivesArticles["items"];
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
          title: 'Stapes archive',
          subtitle:
              'Here you\'ll find links to older podcasts as a host/guest, articles, and other stuff we find about Joe',
        ),
        urllist("As a podcast host", _archivesHost),
        urllist("As a podcast guest", _archivesGuest),
        urllist("Articles", _archivesArticles),
      ]),
    );
  }
}
