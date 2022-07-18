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
