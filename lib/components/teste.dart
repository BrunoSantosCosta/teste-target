import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Item {
  final String text;

  Item(this.text);
}

class Store {
  final items = ObservableList<Item>().asObservable();
  final TextEditingController controller = TextEditingController();

  Store() {
    _loadData();
  }

  void addItem(String text) {
    items.add(Item(text));
    _saveData();
    controller.clear();
  }

  void editItem(int index, String newText) {
    items[index] = Item(newText);
    _saveData();
  }

  void deleteItem(int index) {
    items.removeAt(index);
    _saveData();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList('items') ?? [];

    for (var text in data) {
      items.add(Item(text));
    }
  }

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    final data = items.map((item) => item.text).toList();
    prefs.setStringList('items', data);
  }
}
