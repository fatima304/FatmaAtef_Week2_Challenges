import 'package:challenges/challenge1/data/models/task_model.dart';
import 'package:challenges/challenge1/ui/widgets/delete_widget.dart';
import 'package:challenges/challenge1/ui/widgets/task_widget.dart';
import 'package:flutter/material.dart';

class Challenge1 extends StatefulWidget {
  const Challenge1({super.key});

  @override
  State<Challenge1> createState() => _Challenge1State();
}

class _Challenge1State extends State<Challenge1> {
  Task? recentlyDeleted;
  int? recentlyDeletedIndex;

  Future<bool?> _confirmDelete(BuildContext ctx, int index) async {
    final confirmed = await showDeleteConfirmDialog(ctx, tasks[index].title);

    if (confirmed == true) {
      _deleteTask(index);
    }
    return false;
  }

  void _deleteTask(int index) {
    setState(() {
      recentlyDeleted = tasks.removeAt(index);
      recentlyDeletedIndex = index;
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Deleted "${recentlyDeleted!.title}"'),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            if (recentlyDeleted != null && recentlyDeletedIndex != null) {
              setState(() {
                tasks.insert(recentlyDeletedIndex!, recentlyDeleted!);
              });
            }
          },
        ),
        duration: const Duration(seconds: 4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reorderable Task List')),
      body:  ReorderableListView.builder(
      buildDefaultDragHandles: false,
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: tasks.length,
      onReorder: (oldIndex, newIndex) {
        setState(() {
          if (newIndex > oldIndex) newIndex -= 1;
          final item = tasks.removeAt(oldIndex);
          tasks.insert(newIndex, item);
        });
      },
      itemBuilder: (context, index) {
        return TaskWidget(
          key: ValueKey(tasks[index].id),
          task: tasks[index],
          index: index,
          confirmDelete: _confirmDelete,
        );
      },
    ),

    );

     }
}
