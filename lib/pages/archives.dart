import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/widgets/archivelist.dart';

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
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(<Widget>[
            archivelist(_archivesHost),
            //archivelist(_archivesGuest),
            //archivelist(_archivesArticles),
          ]),
        )
      ],
    );
  }
}
