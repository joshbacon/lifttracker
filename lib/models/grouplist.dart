import 'package:lifttracker/models/groupdata.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GroupList {

  GroupList();

  final List<GroupData> _list = [
    GroupData(0, 'Chest', []),
    GroupData(1, 'Shoulders', []),
    GroupData(2, 'Back', []),
    GroupData(3, 'Arms', []),
    GroupData(4, 'Core', []),
    GroupData(5, 'Legs', []),
  ];

  void loadData() async {
    // ignore: invalid_use_of_visible_for_testing_member
    SharedPreferences.setMockInitialValues({});
    try {
      List<GroupData> tempList = [];
      final prefs = await SharedPreferences.getInstance();
      for (GroupData group in _list) {
        try {
          String? data = prefs.getString(group.id.toString());
          if (data != null) {
            tempList.add(GroupData.fromString(data));
          } else {
            tempList.add(_list[group.id]);
          }
        } catch (e) {
          tempList.add(_list[group.id]);
        }
      }
    // ignore: empty_catches
    } catch (e) {} // there is nothing in shared preferences to read
  }

  List<GroupData> getList() => _list;

  GroupData getGroup(int index) => _list[index];

}