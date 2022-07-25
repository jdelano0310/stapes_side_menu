import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:hexcolor/hexcolor.dart';

class TableCellPadded extends StatelessWidget {
  final EdgeInsets? padding;
  final Widget child;
  final TableCellVerticalAlignment? verticalAlignment;

  const TableCellPadded(
      {Key? key, required this.child, this.padding, this.verticalAlignment})
      : super(key: key);

  @override
  TableCell build(BuildContext context) => TableCell(
      verticalAlignment: verticalAlignment ?? TableCellVerticalAlignment.middle,
      child: Padding(
          padding: padding ?? const EdgeInsets.all(10.0), child: child));
}

class URLData extends StatelessWidget {
  final String url;
  final String displayText;

  const URLData({super.key, required this.url, required this.displayText});

  @override
  Link build(BuildContext context) => Link(
        uri: Uri.parse(url),
        builder: (context, followLink) => MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: followLink,
            child: Text(
              displayText,
              style: TextStyle(
                color: HexColor('#c94663'),
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
      );
}

class DisplayTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const DisplayTitle({super.key, required this.title, required this.subtitle});
  @override
  Container build(BuildContext context) => Container(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
