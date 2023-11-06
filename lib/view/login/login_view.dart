import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:target_teste/controller/login/login_mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:url_launcher/link.dart';

class LoginPage extends StatelessWidget {
  final loginMobx = LoginMobx();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(210, 2, 50, 80),
                  Color.fromARGB(186, 9, 113, 19)
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  constraints: BoxConstraints(
                    maxWidth:
                        MediaQuery.of(context).size.width > 500 ? 450 : 320,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.person, color: Colors.black),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(20),
                                ],
                                controller: _userController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Usuario",
                                ),
                                onChanged: (value) {
                                  final trimmedText = value.trim();
                                  if (value != trimmedText) {
                                    _userController.text = trimmedText;
                                    _userController.selection =
                                        TextSelection.fromPosition(
                                      TextPosition(offset: trimmedText.length),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.lock, color: Colors.black),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                controller: _passwordController,
                                obscureText: loginMobx.obscurePassword,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(20),
                                ],
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Senha",
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      loginMobx.obscurePassword
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: () =>
                                        loginMobx.togglePasswordVisibility(),
                                  ),
                                ),
                                onChanged: (value) {
                                  loginMobx.password = value;
                                  final trimmedText = value.trim();
                                  if (value != trimmedText) {
                                    _passwordController.text = trimmedText;
                                    _passwordController.selection =
                                        TextSelection.fromPosition(
                                      TextPosition(offset: trimmedText.length),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Icon(
                            loginMobx.password.length > 2
                                ? Icons.check
                                : Icons.close,
                            size: 25,
                            color: loginMobx.password.length > 2
                                ? Colors.green
                                : Colors.red,
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              'O campo senha não pode ter menos que dois caracteres.',
                              style: TextStyle(
                                color: loginMobx.password.length > 2
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Icon(
                            RegExp(r'^[a-zA-Z0-9]*$')
                                    .hasMatch(loginMobx.password)
                                ? Icons.check
                                : Icons.close,
                            size: 25,
                            color: RegExp(r'^[a-zA-Z0-9]*$')
                                    .hasMatch(loginMobx.password)
                                ? Colors.green
                                : Colors.red,
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              'O campo senha não pode ter caracteres especiais, sendo apenas possível informar \'a\' até \'Z\' e \'0\' até \'9\'.',
                              style: TextStyle(
                                color: RegExp(r'^[a-zA-Z0-9]*$')
                                        .hasMatch(loginMobx.password)
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (loginMobx.password.length < 2) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'O campo senha não pode ter menos que dois caracteres.')),
                            );
                          } else if (!RegExp(r'^[a-zA-Z0-9]*$')
                              .hasMatch(loginMobx.password)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'O campo senha não pode ter caracteres especiais, sendo apenas possível informar \'a\' até \'Z\' e \'0\' até \'9\'.')),
                            );
                          } else if (_userController.text.isEmpty ||
                              _passwordController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Ambos os campos devem estar preenchidos!')),
                            );
                          } else {
                            Navigator.pushNamed(context, '/home');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green, // Cor de fundo verde
                          disabledForegroundColor:
                              Colors.greenAccent.withOpacity(0.38),
                          disabledBackgroundColor:
                              Colors.greenAccent.withOpacity(0.12),
                          shadowColor: Colors.black,
                          elevation: 5,
                        ),
                        child: const Text(
                          'Entrar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 7),
                        child: Link(
                          uri: Uri.parse('https://www.google.com.br'),
                          builder: (context, openLink) => TextButton(
                            onPressed: openLink,
                            child: const Text(
                              'Política de privacidade',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
