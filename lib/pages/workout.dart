import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lifttracker/models/exercisedata.dart';
import 'package:lifttracker/models/exerciselist.dart';
import 'package:lifttracker/models/grouplist.dart';
import 'package:shared_preferences/shared_preferences.dart';


class WorkoutPage extends StatefulWidget {
  const WorkoutPage({super.key, required this.groupList, required this.exerciseList, required this.tempList});

  final GroupList groupList;
  final ExerciseList exerciseList;
  final ExerciseList tempList;

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {

  void saveLocal() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("workout", widget.exerciseList.toString());
    // ignore: empty_catches
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    final List<Card> cards = <Card>[
      for (int index = 0; index < widget.exerciseList.getList().length; index += 1)
        Card(
          key: Key('$index'),
          color: widget.exerciseList.getList()[index].done ? Theme.of(context).colorScheme.primary.withAlpha(69) : Theme.of(context).colorScheme.surfaceDim,
          shadowColor: Theme.of(context).colorScheme.primary,
          elevation: widget.exerciseList.getList()[index].done ? 0 : 3,
          child: SizedBox(
            height: 80,
            child: Row(
              children: [
                Checkbox(
                  value: widget.exerciseList.getList()[index].done,
                  onChanged: (newValue) {
                    widget.exerciseList.getExercise(index).updateDone(newValue ?? false);
                    setState(() {});
                    saveLocal();
                  }
                ),
                Text(
                  widget.exerciseList.getList()[index].title,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ),
    ];

    Widget proxyDecorator(Widget child, int index, Animation<double> animation) {
      return AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) {
          final double animValue = Curves.easeInOut.transform(animation.value);
          final double elevation = lerpDouble(3, 6, animValue)!;
          final double scale = lerpDouble(1, 1.02, animValue)!;
          return Transform.scale(
            scale: scale,
            child: Card(
              elevation: elevation,
              shadowColor: Theme.of(context).colorScheme.primary,
              color: cards[index].color,
              child: cards[index].child,
            ),
          );
        },
        child: child,
      );
    }

    return ReorderableListView(
      header: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Workout Plan", style: Theme.of(context).textTheme.titleLarge),
                FloatingActionButton(
                  foregroundColor: Theme.of(context).colorScheme.primary,
                  backgroundColor: Theme.of(context).colorScheme.surfaceDim,
                  onPressed: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => Dialog(
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Are you sure you want to clear the current workout?',
                                style: Theme.of(context).textTheme.bodyLarge
                              ),
                              const SizedBox(height: 36.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    }, 
                                    child: const Text("Cancel")
                                  ),
                                  const SizedBox(width: 8.0),
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        widget.exerciseList.clear();
                                      });
                                      saveLocal();
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Confirm"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    );
                  },
                  child: const Text("Clear"),
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => Dialog(
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    child: StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) => ListView(
                        padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 8.0),
                        children: [
                          ...widget.groupList.getList().map((group) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  group.title,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                ...group.exercises.map((exercise) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (widget.tempList.contains(exercise)) {
                                          widget.tempList.remove(exercise);
                                        } else {
                                          widget.tempList.add(exercise);
                                        }
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        Checkbox(
                                          value: widget.tempList.contains(exercise),
                                          onChanged: (newValue) {
                                            setState(() {
                                              if (widget.tempList.contains(exercise)) {
                                                widget.tempList.remove(exercise);
                                              } else {
                                                widget.tempList.add(exercise);
                                              }
                                            });
                                          }
                                        ),
                                        Text(exercise.title)
                                      ],
                                    ),
                                  );
                                }),
                                Divider(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ]
                            );
                          }),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context, {'wasChanged': false, 'newList': []});
                                }, 
                                child: const Text("Cancel"),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context, {'wasChanged': true, 'newList': widget.tempList});
                                },
                                child: const Text("Confirm"),
                              ),
                            ],
                          ),
                        ]
                      ),
                    ),
                  ),
                ).then((value) async {
                  if (value != null && value['wasChanged']) {
                    setState(() {
                      widget.exerciseList.set(widget.tempList.getList());
                    });
                    saveLocal();
                  }
                });
              },
              child: Card(
                color: Theme.of(context).colorScheme.onSecondary,
                shadowColor: Theme.of(context).colorScheme.primary,
                elevation: 3,
                child: SizedBox(
                  height: 80,
                  child: Center(
                    child: Text(
                      'Select Exercises',
                        style: Theme.of(context).textTheme.bodyLarge
                      ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      padding: const EdgeInsets.fromLTRB(16.0, 36.0, 16.0, 0.0),
      proxyDecorator: proxyDecorator,
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final ExerciseData item = widget.exerciseList.removeAt(oldIndex);
          widget.exerciseList.insert(newIndex, item);
        });
        saveLocal();
      },
      children: cards,
    );
  }
}
