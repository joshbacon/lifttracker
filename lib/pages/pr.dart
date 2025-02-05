import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:lifttracker/models/grouplist.dart';
import 'package:lifttracker/widgets/groupcard.dart';

class PRPage extends StatefulWidget {
  const PRPage({super.key, required this.groupList});

  final GroupList groupList;

  @override
  State<PRPage> createState() => _PRPageState();
}

class _PRPageState extends State<PRPage> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(flex: 1),
        Expanded(
          flex: 6,
          child: GridView.count(
            padding: const EdgeInsets.all(12.0),
            crossAxisCount: 2,
            dragStartBehavior: DragStartBehavior.down,
            children: widget.groupList.getList().map((group) => GroupCard(data: group)).toList(),
          ),
        ),
      ],
    );
  }
}