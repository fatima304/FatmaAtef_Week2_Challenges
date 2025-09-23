import 'package:flutter/material.dart';

Future<bool?> showDeleteConfirmDialog(BuildContext context, String task) {
  return showDialog<bool>(
    context: context,
    builder: (c) => AlertDialog(
      title: const Text('Confirm delete'),
      content: Text('Delete "$task"?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(c).pop(false),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.of(c).pop(true),
          child: const Text('Delete'),
        ),
      ],
    ),
  );
}

