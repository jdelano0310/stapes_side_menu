import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class ReadJSON {
  final String jsonFile;
  final String sectionName;

  List _section = [];
  List get result => _section;

  ReadJSON(this.jsonFile, this.sectionName);

  ReadJSON.read(this.jsonFile, this.sectionName) {
    debugPrint(jsonFile);
    Future<String> future = rootBundle.loadString(jsonFile);
    future.then((String jsonStr) {
      debugPrint(jsonStr);
      var decodedJSON;

      decodedJSON = json.decode(jsonStr);
      debugPrint(decodedJSON);

      _section = decodedJSON[sectionName];
      debugPrint(_section.toString());
    });
  }
}
