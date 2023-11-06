// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeMobx on _HomeMobx, Store {
  late final _$textsAtom = Atom(name: '_HomeMobx.texts', context: context);

  @override
  ObservableList<String> get texts {
    _$textsAtom.reportRead();
    return super.texts;
  }

  @override
  set texts(ObservableList<String> value) {
    _$textsAtom.reportWrite(value, super.texts, () {
      super.texts = value;
    });
  }

  late final _$addTextAsyncAction =
      AsyncAction('_HomeMobx.addText', context: context);

  @override
  Future<void> addText(String text) {
    return _$addTextAsyncAction.run(() => super.addText(text));
  }

  late final _$loadTextsAsyncAction =
      AsyncAction('_HomeMobx.loadTexts', context: context);

  @override
  Future<void> loadTexts() {
    return _$loadTextsAsyncAction.run(() => super.loadTexts());
  }

  @override
  String toString() {
    return '''
texts: ${texts}
    ''';
  }
}
