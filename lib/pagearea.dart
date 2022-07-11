import 'package:flutter/material.dart';

class MyPageArea extends StatefulWidget {
  final PageController page;
  const MyPageArea({Key? key, required this.page}) : super(key: key);

  @override
  State<MyPageArea> createState() => _MyPageAreaState();
}

class _MyPageAreaState extends State<MyPageArea> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView(
        controller: widget.page,
        children: const [
          PageContainer(
            value: 'The Latest',
          ),
          PageContainer(
            value: 'Podcast Host',
          ),
          PageContainer(
            value: 'Podcast Guest',
          ),
          PageContainer(
            value: 'Articles',
          ),
          PageContainer(
            value: 'TV & Movies',
          ),
          PageContainer(
            value: 'About Joe',
          ),
          PageContainer(
            value: 'Highlights',
          ),
          PageContainer(
            value: 'Archive',
          ),
        ],
      ),
    );
  }
}

class PageContainer extends StatelessWidget {
  final String value;

  const PageContainer({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text(
          value,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
