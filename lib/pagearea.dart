import 'package:flutter/material.dart';
import 'package:stapes_side_menu/pages/the_latest.dart';

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
            child: TheLatest(),
          ),
          PageContainer(
            child: Text('Podcast Host'),
          ),
          PageContainer(
            child: Text('Podcast Guest'),
          ),
          PageContainer(
            child: Text('Articles'),
          ),
          PageContainer(
            child: Text('TV & Movies'),
          ),
          PageContainer(
            child: Text('About Joe'),
          ),
          PageContainer(
            child: Text('Highlights'),
          ),
          PageContainer(
            child: Text('Archive'),
          ),
        ],
      ),
    );
  }
}

class PageContainer extends StatelessWidget {
  final Widget child;

  const PageContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: child);
  }
}
