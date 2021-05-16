import 'package:flutter/material.dart';
import 'package:todo/model/todo_model.dart';
import 'package:intl/intl.dart';
  
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  final format = DateFormat("d MMMM, y");

  
  
  
 List<TodoModel> todos = [];