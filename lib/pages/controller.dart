import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lifttracker/models/exerciselist.dart';
import 'package:lifttracker/models/grouplist.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:lifttracker/pages/pr.dart';
import 'package:lifttracker/pages/workout.dart';

class ControllerPage extends StatefulWidget {
  const ControllerPage({super.key});

  @override
  State<ControllerPage> createState() => _ControllerPageState();
}

class _ControllerPageState extends State<ControllerPage> {

  final GroupList list = GroupList();
  final ExerciseList _exercises = ExerciseList();

  final _pageController = PageController(initialPage: 0);
  final NotchBottomBarController _controller = NotchBottomBarController(index: 0);

  @override
  void initState() {
    super.initState();
    list.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      resizeToAvoidBottomInset: false,
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
          PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(2, (index) => [
              WorkoutPage(groupList: list, exerciseList: _exercises),
              PRPage(groupList: list),
            ][index]),
          ),
        ]
      ),
      bottomNavigationBar: AnimatedNotchBottomBar(
        color: Theme.of(context).colorScheme.primary,
        notchBottomBarController: _controller,
        removeMargins: true,
        durationInMilliSeconds: 100,
        showLabel: false,
        notchColor: Theme.of(context).colorScheme.primary,
        kIconSize: 24.0,
        kBottomRadius: 0.0,
        bottomBarItems: <BottomBarItem> [
          BottomBarItem(
            inActiveItem: Icon(
              Icons.view_list_rounded,
              size: 24.0,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            activeItem: Icon(
              Icons.view_list_rounded,
              size: 24.0,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            itemLabel: 'workout',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.bar_chart_rounded,
              size: 24.0,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            activeItem: Icon(
              Icons.bar_chart_rounded,
              size: 24.0,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            itemLabel: 'pr',
          ),
        ],
        onTap: (int index) {
          _pageController.jumpToPage(index);
        },
      ),
    );
  }
}