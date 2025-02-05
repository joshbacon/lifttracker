import 'dart:math';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:lifttracker/pages/pr.dart';
import 'package:lifttracker/pages/workout.dart';
import 'package:lifttracker/models/grouplist.dart';
import 'package:lifttracker/models/exerciselist.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';

class ControllerPage extends StatefulWidget {
  const ControllerPage({super.key});

  @override
  State<ControllerPage> createState() => _ControllerPageState();
}

class _ControllerPageState extends State<ControllerPage> {

  bool doneLoading = false;

  final GroupList groups = GroupList();
  final ExerciseList exercises = ExerciseList();
  final ExerciseList tempList = ExerciseList();

  final _pageController = PageController(initialPage: 0);
  final NotchBottomBarController _controller = NotchBottomBarController(index: 0);

  loadData() async {
    Future.wait([groups.loadData(), exercises.loadData(), tempList.loadData()])
      .then((newValues) =>setState(() {
        doneLoading = true;
      })).catchError((_) {});
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return !doneLoading ? Scaffold(
      body: Center(
        child: Image.asset(
          'assets/loading.gif',
          width: 325.0,
          height: 325.0,
        ),
      )
    ) : Scaffold(
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
          Container(
            color: Theme.of(context).colorScheme.surface.withAlpha(150),
          ),
          PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(2, (index) => [
              WorkoutPage(groupList: groups, exerciseList: exercises, tempList: tempList),
              PRPage(groupList: groups),
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