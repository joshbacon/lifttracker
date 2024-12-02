import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lifttracker/models/grouplist.dart';
import 'package:lifttracker/widgets/groupcard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.groupList});

  final GroupList groupList;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    widget.groupList.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
        children: [
          Positioned(
            bottom: -20,
            right: -20,
            child: RotatedBox(
              quarterTurns: Random().nextInt(8),
              child: SvgPicture.asset(
                'assets/blob1.svg',
                width: 300.0,
                height: 300.0,
              ),
            )
          ),
          Positioned(
            bottom: 200,
            left: -100,
            child: RotatedBox(
              quarterTurns: Random().nextInt(8),
              child: SvgPicture.asset(
                'assets/blob2.svg',
                width: 300.0,
                height: 300.0,
              ),
            )
          ),
          Positioned(
            top: -120,
            right: -50,
            child: RotatedBox(
              quarterTurns: Random().nextInt(8),
              child: SvgPicture.asset(
                'assets/blob3.svg',
                width: 300.0,
                height: 300.0,
              ),
            )
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 1),
              Expanded(
                flex: 4,
                child: GridView.count(
                  padding: const EdgeInsets.all(12.0),
                  crossAxisCount: 2,
                  dragStartBehavior: DragStartBehavior.down,
                  children: widget.groupList.getList().map((group) => GroupCard(data: group)).toList(),
                ),
              ),
            ],
          ),
        ]
      ),
    );
  }
}