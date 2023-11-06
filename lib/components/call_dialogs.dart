import 'package:flutter/material.dart';
import 'package:target_teste/components/content_save.dart';
import 'package:target_teste/components/custom_dialog.dart';

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
        textButton: 'Salvar',
      );
    },
  );

  if (text != null) {
    store.editItem(index, text);
  }
}

Future<void> _deleteItem(BuildContext context, Store store, int index) async {
  final TextEditingController editController = TextEditingController();

  final text = await showDialog<String>(
    context: context,
    builder: (context) {
      editController.text = store.items[index].text;
      return CustomDialog(
        title: 'Excluir Texto ${index + 1}',
        content: 'Ao excluir você não vai poder recuperar o conteúdo',
        onButtonPressed: () {
          store.deleteItem(index);
          Navigator.pop(context);
        },
        textButton: 'Excluir',
      );
    },
  );

  if (text != null) {
    store.editItem(index, text);
  }
}
