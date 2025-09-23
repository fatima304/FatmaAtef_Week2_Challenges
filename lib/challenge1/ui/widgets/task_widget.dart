import 'package:challenges/challenge1/data/models/task_model.dart';
import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget {
  final Task task;
  final int index;
  final Future<bool?> Function(BuildContext context, int index) confirmDelete;

  const TaskWidget({
    super.key,
    required this.task,
    required this.index,
    required this.confirmDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: key!,
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      confirmDismiss: (_) async {
        return confirmDelete(context, index);
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ListTile(
          leading: ReorderableDragStartListener(
            index: index,
            child: const Icon(Icons.drag_handle),
          ),
          tileColor: Colors.grey[200],
          title: Text(task.title),
        ),
      ),
    );
  }
}
