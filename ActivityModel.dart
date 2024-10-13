import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ActivityModel extends ChangeNotifier {
  List<Map<String, bool>> _activityHistory = [];

  List<Map<String, bool>> get activityHistory => _activityHistory;

  ActivityModel() {
    loadActivities();
  }

  void addActivity(Map<String, bool> activity) {
    _activityHistory.add(activity);
    saveActivities();
    notifyListeners();
  }

  void clearHistory() {
    _activityHistory.clear();
    saveActivities();
    notifyListeners();
  }

  void saveActivities() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> activityList = _activityHistory.map((activity) {
      return activity.entries.map((e) => '${e.key}:${e.value}').join(',');
    }).toList();

    prefs.setStringList('activityHistory', activityList);
  }

  void loadActivities() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? activityList = prefs.getStringList('activityHistory');

    if (activityList != null) {
      _activityHistory = activityList.map((activityString) {
        Map<String, bool> activityMap = {};
        List<String> entries = activityString.split(',');

        for (var entry in entries) {
          var keyValue = entry.split(':');
          activityMap[keyValue[0]] = keyValue[1] == 'true';
        }

        return activityMap;
      }).toList();

      notifyListeners();
    }
  }
}
