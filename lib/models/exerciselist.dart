import 'dart:convert';
import 'package:lifttracker/models/exercisedata.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExerciseList {

  ExerciseList();

  List<ExerciseData> _exercises = [];

  Future<dynamic> loadData() async {
    try {
      List<ExerciseData> tempList = [];
      final prefs = await SharedPreferences.getInstance();
      try {
        String? workout = prefs.getString("workout");
        if (workout != null) {
          List<dynamic> data = jsonDecode(workout);
          tempList = data.map((e) => ExerciseData.fromMap(e)).toList();
        }
      // ignore: empty_catches
      } catch (_) {}
      _exercises = tempList;
      return tempList;
    } catch (_) {
      return []; // there is nothing in shared preferences to read
    }
  }

  List<ExerciseData> getList() => _exercises;

  ExerciseData getExercise(int index) => _exercises[index];

  @override
  String toString() {
    return "[${_exercises.map((e) => e.toString()).join(",")}]";
  }

  bool contains(exercise) {
    return _exercises.contains(exercise);
  }

  void add(ExerciseData newExercise) {
    _exercises.add(newExercise);
  }

  void remove(ExerciseData removing) {
    _exercises[_exercises.indexOf(removing)].updateDone(false);
    _exercises.removeWhere((item) => item.group == removing.group && item.title == removing.title);
  }

  ExerciseData removeAt(index) {
    _exercises[index].updateDone(false);
    return _exercises.removeAt(index);
  }

  void insert(index, exercise) {
    _exercises.insert(index, exercise);
  }

  void clear() {
    for (int index = 0; index < _exercises.length; index++){
      _exercises[index].updateDone(false);
    }
    _exercises = [];
  }

  void set(List<ExerciseData> newList) {
    _exercises = newList;
  }

}