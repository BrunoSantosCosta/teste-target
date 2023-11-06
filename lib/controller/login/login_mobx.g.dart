// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginMobx on LoginMobxBase, Store {
  Computed<bool>? _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: 'LoginMobxBase.isPasswordValid'))
          .value;

  late final _$passwordAtom =
      Atom(name: 'LoginMobxBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$obscurePasswordAtom =
      Atom(name: 'LoginMobxBase.obscurePassword', context: context);

  @override
  bool get obscurePassword {
    _$obscurePasswordAtom.reportRead();
    return super.obscurePassword;
  }

  @override
  set obscurePassword(bool value) {
    _$obscurePasswordAtom.reportWrite(value, super.obscurePassword, () {
      super.obscurePassword = value;
    });
  }

  late final _$LoginMobxBaseActionController =
      ActionController(name: 'LoginMobxBase', context: context);

  @override
  void togglePasswordVisibility() {
    final _$actionInfo = _$LoginMobxBaseActionController.startAction(
        name: 'LoginMobxBase.togglePasswordVisibility');
    try {
      return super.togglePasswordVisibility();
    } finally {
      _$LoginMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
password: ${password},
obscurePassword: ${obscurePassword},
isPasswordValid: ${isPasswordValid}
    ''';
  }
}
