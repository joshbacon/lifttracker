import 'dart:convert';
import 'package:lifttracker/models/exercisedata.dart';

class GroupData {

  GroupData(int id, String title, List<ExerciseData> exercises) {
    _id = id;
    _title = title;
    _exercises = exercises;
  }

  GroupData.fromString(String json) {
    dynamic data = jsonDecode(json);
    _id = data["_id"];
    _title = data["_title"];
    _exercises = data["_exercises"];
  }

  late int _id;
  late String _title;
  late List<ExerciseData> _exercises;

  int get id => _id;
  String get title => _title;
  List<ExerciseData> get exercises => _exercises;

  void updateTitle(String newTitle) {
    _title = newTitle;
  }

  void addExercise(ExerciseData newExercise) {
    _exercises.add(newExercise);
  }

  void removeExercise(int index) {
    _exercises.removeAt(index);
  }

  @override
  String toString() {
    return jsonEncode({"_id": _id, "_title": _title, "_exercises": jsonEncode(_exercises)});
  }

}