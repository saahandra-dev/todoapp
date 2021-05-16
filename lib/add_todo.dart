import 'package:flutter/material.dart';
import 'package:todo/main.dart';
import 'package:todo/model/todo_model.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:todo/const.dart';

class AddTodoPage extends StatefulWidget {
  @override
  _AddTodoPageState createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
      padding: EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
        Text('Create todo',
        style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w400
          )
        ),
        InkWell(
          onTap: (){Navigator.pop(context);},
          child: Icon(Icons.clear,
          size: 30.0,),
        ),
          ],),
          

        SizedBox(height: 20),

        Text('Add a title',
        style: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.w500,
        color: Colors.black,
          ),
        ),

      TextFormField(
        controller: titleController,
        maxLength: 20,
        decoration: InputDecoration(
          hintText: 'click to add title',
          hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 10,
          )
        ),
      ),

      SizedBox(height: 25.0),

      Text('Deadline',
      style: TextStyle(
        color: Colors.black,
        fontSize: 25.0,
        fontWeight: FontWeight.w500
      ),
      ),

      DateTimeField(
        decoration: InputDecoration(
          hintText: 'click to input date & time',
          hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 10,
          ),
        ),
        controller: dateController,
        format: format,
        onShowPicker: (context, currentValue) async {
          final date = await showDatePicker(
            context: context,
            firstDate: DateTime(1900),
            initialDate: currentValue ?? DateTime.now(),
            lastDate: DateTime(2100));
          if (date != null) {
          final time = await showTimePicker(
            context: context,
            initialTime:
        TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
          );
          return DateTimeField.combine(date, time);
          } else {
          return currentValue;
          }
        },
      ),

      SizedBox(height: 20.0),
      Text('Add a description',
        style: TextStyle(
          color: Colors.black,
          fontSize: 25.0,
          fontWeight: FontWeight.w500
        )
        ),

      SizedBox(height: 20.0),
      TextFormField(
        maxLines: 4,
        controller: descriptionController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)
          ),
          fillColor: Colors.grey[100],
          filled: true
        )
      ),

      Spacer(),
      Align(
        alignment: Alignment.bottomRight,
        child: ElevatedButton(
          onPressed: () {
            if (titleController.text.isNotEmpty &&
            descriptionController.text.isNotEmpty && 
            dateController.text.isNotEmpty) {
            setState(() {
              todos.add(TodoModel(
                title: titleController.text,
                date: dateController.text,
                description: descriptionController.text
              ));
            });
            }
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyTodos()
          )
          );
          }, 
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text('FINISH',
            style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.w600,
            ),
            ),
          ),
        ),
      ),
      
      ],),
      
            ) ,
        )
      
    );
  }
}