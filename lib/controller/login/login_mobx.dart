import 'package:mobx/mobx.dart';

part 'login_mobx.g.dart';

class LoginMobx = LoginMobxBase with _$LoginMobx;

abstract class LoginMobxBase with Store {
  @observable
  String password = '';

  @observable
  bool obscurePassword = true;

  @computed
  bool get isPasswordValid {
    return (password.length >= 2 &&
        RegExp(r'^[a-zA-Z0-9]*$').hasMatch(password));
  }

  @action
  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
  }
}
