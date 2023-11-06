import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:target_teste/components/custom_dialog.dart';
import 'package:target_teste/components/teste.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../controller/home/home_mobx.dart';

class HomePage extends StatelessWidget {
  final homeMobx = HomeMobx();
  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final Store store = Store();
    final TextEditingController textFieldController = TextEditingController();

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Observer(
                  builder: (context) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: store.items.length,
                      itemBuilder: (context, index) {
                        final item = store.items[index];
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(20), // Borda arredondada
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                              ),
                            ],
                          ),
                          //   color: Colors.white,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          child: ListTile(
                            title: Text(
                              'Texto Digitado ${index + 1}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(item.text),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                IconButton(
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    _editItem(context, store, index);
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    store.deleteItem(index);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.text_snippet_rounded,
                            color: Colors.black),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: textFieldController,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(20),
                            ],
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Digite seu texto",
                            ),
                            onSubmitted: (String value) {
                              if (value.isNotEmpty) {
                                store.addItem(value);
                                textFieldController.clear();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

Future<void> _editItem(BuildContext context, Store store, int index) async {
  final TextEditingController editController = TextEditingController();

  final text = await showDialog<String>(
    context: context,
    builder: (context) {
      editController.text = store.items[index].text;
      return CustomDialog(
        title: 'Editar Texto ${index + 1}',
        content: '',
        onButtonPressed: () {
          Navigator.of(context).pop(editController.text);
        },
        textfield: editController,
      );
    },
  );

  if (text != null) {
    store.editItem(index, text); // Salva o novo texto no lugar do antigo
  }
}
