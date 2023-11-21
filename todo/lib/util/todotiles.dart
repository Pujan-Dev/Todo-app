// ignore_for_file: sort_child_properties_last, non_constant_identifier_names, depend_on_referenced_packages, camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class todotiles extends StatelessWidget {
  final String TaskName;
  final bool TaskComplete;
  Function(bool?)? onChanged;
  Function(BuildContext)? deletefunction;

  todotiles({
    super.key,
    required this.TaskName,
    required this.TaskComplete,
    required this.onChanged,
    required this.deletefunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: deletefunction,
            icon: Icons.delete,
            backgroundColor: Colors.red.shade300,
            borderRadius: BorderRadius.circular(12),
          ),
        ]),
        child: Container(
          padding: const EdgeInsets.all(25),
          child: Row(
            children: [
              Checkbox(
                value: TaskComplete,
                onChanged: onChanged,
                activeColor: Colors.white12,
                checkColor: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              Flexible(
                child: Text(
                  TaskName,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    decoration: TaskComplete
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: const Color.fromARGB(230, 47, 48, 48),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}