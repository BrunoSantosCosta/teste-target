// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_mobx.g.dart';

class HomeMobx = _HomeMobx with _$HomeMobx;

abstract class _HomeMobx with Store {
  @observable
  ObservableList<String> texts = ObservableList<String>();

  @action
  Future<void> addText(String text) async {
    texts.add(text);
    await _saveToSharedPreferences();
  }

  @action
  Future<void> loadTexts() async {
    final prefs = await SharedPreferences.getInstance();
    texts.clear();
    texts.addAll(prefs.getStringList('texts') ?? []);
  }

  Future<void> _saveToSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('texts', texts.toList());
  }
}
