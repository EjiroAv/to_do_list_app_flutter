import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list_app_flutter/models/task.dart';
import 'dart:collection';
import 'package:to_do_list_app_flutter/lists.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = today;
  late int totalNumberOfCategories = 5;
  late String listName;
  late List<Task>? _tempTodayData = today;
  late List<Task>? _tempPlannedData = planned;
  late List<Task>? _tempPersonalData = personal;
  late List<Task>? _tempWorkData = work;
  late List<Task>? _tempShoppingData = shopping;
  late int todayTaskLength;
  late SharedPreferences prefs;

  void selectListCategory(int selectedCategory) async {
    if (selectedCategory == 1) {
      listName = 'today';
      LoadData(listName: listName, alternativeList: today);
    } else if (selectedCategory == 2) {
      listName = 'planned';
      LoadData(listName: listName, alternativeList: planned);
    } else if (selectedCategory == 3) {
      listName = 'personal';
      LoadData(listName: listName, alternativeList: personal);
    } else if (selectedCategory == 4) {
      listName = 'work';
      LoadData(listName: listName, alternativeList: work);
    } else if (selectedCategory == 5) {
      listName = 'shopping';
      LoadData(listName: listName, alternativeList: shopping);
    }
    notifyListeners();
  }

  void LoadData(
      {required String listName, required List<Task> alternativeList}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString(listName) == null) {
      _tasks = alternativeList;
    } else {
      List map = jsonDecode(prefs.getString(listName)!) as List;
      List<Task>? usersList = map.map((item) => Task.fromJson(item)).toList();
      _tasks = usersList;
    }
  }

  void loadTodayCount(
      {required String listName, required List<Task> alternativeList}) async {
    SharedPreferences.getInstance().then((SharedPreferences sp) {
      prefs = sp;

      if (prefs.getString(listName) == null) {
        _tempTodayData = alternativeList;
      } else {
        List map = jsonDecode(prefs.getString(listName)!) as List;
        List<Task>? usersList = map.map((item) => Task.fromJson(item)).toList();
        _tempTodayData = usersList;
      }
    });
  }

  void loadPlannedCount(
      {required String listName, required List<Task> alternativeList}) async {
    SharedPreferences.getInstance().then((SharedPreferences sp) {
      prefs = sp;

      if (prefs.getString(listName) == null) {
        _tempPlannedData = alternativeList;
      } else {
        List map = jsonDecode(prefs.getString(listName)!) as List;
        List<Task>? usersList = map.map((item) => Task.fromJson(item)).toList();
        _tempPlannedData = usersList;
      }
    });
  }

  void loadPersonalCount(
      {required String listName, required List<Task> alternativeList}) async {
    SharedPreferences.getInstance().then((SharedPreferences sp) {
      prefs = sp;

      if (prefs.getString(listName) == null) {
        _tempPersonalData = alternativeList;
      } else {
        List map = jsonDecode(prefs.getString(listName)!) as List;
        List<Task>? usersList = map.map((item) => Task.fromJson(item)).toList();
        _tempPersonalData = usersList;
      }
    });
  }

  void loadWorkCount(
      {required String listName, required List<Task> alternativeList}) async {
    SharedPreferences.getInstance().then((SharedPreferences sp) {
      prefs = sp;

      if (prefs.getString(listName) == null) {
        _tempWorkData = alternativeList;
      } else {
        List map = jsonDecode(prefs.getString(listName)!) as List;
        List<Task>? usersList = map.map((item) => Task.fromJson(item)).toList();
        _tempWorkData = usersList;
      }
    });
  }

  void loadShoppingCount(
      {required String listName, required List<Task> alternativeList}) async {
    SharedPreferences.getInstance().then((SharedPreferences sp) {
      prefs = sp;

      if (prefs.getString(listName) == null) {
        _tempShoppingData = alternativeList;
      } else {
        List map = jsonDecode(prefs.getString(listName)!) as List;
        List<Task>? usersList = map.map((item) => Task.fromJson(item)).toList();
        _tempShoppingData = usersList;
      }
    });
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  int getTodayTaskCount() {
    loadTodayCount(listName: 'today', alternativeList: today);
    if (_tempTodayData == null) {
      return today.length;
    } else {
      return _tempTodayData!.length;
    }
  }

  int getPlannedTaskCount() {
    loadPlannedCount(listName: 'planned', alternativeList: today);
    if (_tempPlannedData == null) {
      return planned.length;
    } else {
      return _tempPlannedData!.length;
    }
  }

  int getPersonalTaskCount() {
    loadPersonalCount(listName: 'personal', alternativeList: today);
    if (_tempPersonalData == null) {
      return personal.length;
    } else {
      return _tempPersonalData!.length;
    }
  }

  int getWorkTaskCount() {
    loadWorkCount(listName: 'work', alternativeList: today);
    if (_tempWorkData == null) {
      return work.length;
    } else {
      return _tempWorkData!.length;
    }
  }

  int getShoppingTaskCount() {
    loadShoppingCount(listName: 'shopping', alternativeList: today);
    if (_tempShoppingData == null) {
      return shopping.length;
    } else {
      return _tempShoppingData!.length;
    }
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
    _saveList(_tasks);
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
    _saveList(_tasks);
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
    _saveList(_tasks);
  }

  _saveList(list) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String listJson = jsonEncode(list);
    print('Generated Json $listJson');
    prefs.setString(listName, listJson);
  }

  _clearList(listName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(listName);
  }
}
