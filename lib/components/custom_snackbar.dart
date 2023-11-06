import 'package:flutter/material.dart';

class CustomSnackbar extends SnackBar {
  CustomSnackbar({
    Key? key,
    required Widget content,
    String? actionLabel,
    VoidCallback? onAction,
  }) : super(
          key: key,
          content: content,
          action: actionLabel != null
              ? SnackBarAction(
                  label: actionLabel,
                  onPressed: onAction!,
                )
              : null,
        );
}
