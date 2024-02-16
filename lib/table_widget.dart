import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

import 'data_widget.dart';

class TableWidget extends StatefulWidget {
  const TableWidget({super.key});

  @override
  State<TableWidget> createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.7,
      height: MediaQuery.sizeOf(context).height * 0.5,
      child: UserInformation(),
    );
  }
}
