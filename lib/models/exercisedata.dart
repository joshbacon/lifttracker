import 'dart:convert';

class ExerciseData {

  ExerciseData(int group, String title, double weight, int reps) {
    _group = group;
    _title = title;
    _weight = weight;
    _reps = reps;
  }

  ExerciseData.newEntry(int group) {
    _group = group;
    _title = "";
    _weight = 0.0;
    _reps = 0;
  }

  ExerciseData.fromMap(Map<String, dynamic> data) {
    _group = data["group"];
    _title = data["title"];
    _weight = data["weight"];
    _reps = data["reps"];
    _done = data["done"];
  }

  late int _group;
  late String _title;
  late double _weight;
  late int _reps;
  bool _done = false;

  int get group => _group;
  String get title => _title;
  double get weight => _weight;
  int get reps => _reps;
  bool get done => _done;

  void updateTitle(String newTitle) {
    _title = newTitle;
  }

  void updateWeight(double newWeight) {
    _weight = newWeight;
  }

  void updateReps(int newReps) {
    _reps = newReps;
  }

  void updateDone(bool newValue) {
    _done = newValue;
  }

  @override
  String toString() {
    return jsonEncode({"group": _group, "title": _title, "weight": _weight, "reps": _reps, "done": _done});
  }

}