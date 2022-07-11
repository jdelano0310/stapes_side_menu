import 'package:flutter/material.dart';

class TheLatest extends StatefulWidget {
  final PageController page;
  const TheLatest({Key? key, required this.page}) : super(key: key);

  @override
  State<TheLatest> createState() => _TheLatestState();
}

class _TheLatestState extends State<TheLatest> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: 250.0,
      itemBuilder: (context, index) => Container(
        padding: const EdgeInsets.all(10.0),
        child: Material(
          elevation: 4.0,
          borderRadius: BorderRadius.circular(5.0),
          color: index % 2 == 0 ? Colors.cyan : Colors.deepOrange,
          child: Center(
            child: Text(index.toString()),
          ),
        ),
      ),
    );
  }
}
