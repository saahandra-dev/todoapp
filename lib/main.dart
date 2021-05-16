import 'package:flutter/material.dart';
import 'package:todo/add_todo.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/const.dart';
import 'package:todo/todo_content.dart';



void main() {
  runApp(TodoList());
}

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Color(0xff1c222e), 
        primaryColor: Color(0xff1c222e),
        textTheme: GoogleFonts.nunitoSansTextTheme(
          Theme.of(context).textTheme
        ),
      ),
      home: MyTodos(),
    );
  }
}

class MyTodos extends StatefulWidget {

  @override
  _MyTodosState createState() => _MyTodosState();
}

class _MyTodosState extends State<MyTodos> {
   
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          size: 30.0
        ),
        title: Text('My todos',
        style: TextStyle(
          fontSize: 20.0,
        ),
        ),
        actions: [Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0),
          child: Icon(Icons.settings,
          size: 27.0,),
        )],
      ),
      body: 
      Column(children: <Widget>[
         Container(
           padding: EdgeInsets.fromLTRB(20.0, 10.0, 0, 0),
           child: Row(
             children: [
               Text('Welcome back',
               textAlign: TextAlign.left,
               style: TextStyle(
                 fontSize: 20.0, 
              
                 color: Colors.white    
                ),
                ),
             ],),
         ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: .0),
          height: 200.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0) 
          ),
         child: Image(
           image: AssetImage('assets/images/todo_img2.jpg',),
           fit: BoxFit.cover
         ),
        ),

        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
            ),
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
              return Card(
                elevation: 1,
                child: InkWell(
                  onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => TodoContent(index)));
                   },
                    child: SizedBox(
                    height: 60.0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                         Row(
                          children: [
                               Container(
                                padding: EdgeInsets.all(2),
                                height: 30.0,
                                width: 30.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.orange
                                  )
                                ),
                                child: GestureDetector(
                              onTap: () {}
                              ,),
                              ),
                            SizedBox(width: 20.0),
                          Text(
                            todos[index].title,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                          Spacer(),
                          Text(
                            todos[index].date,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400
                            )
                          )
                           ],)
                        ],
                      ),
                    ),

                  ),
                ),
              );
            }),
            
            ),
          ),
      ],),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          titleController.clear();
          dateController.clear();
          descriptionController.clear();
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddTodoPage()
          )
          );
        },
        tooltip: 'add todo',
        backgroundColor: Color(0xff1c222e),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Icon(Icons.add,
        size: 35.0),
        ),
    );
  }
}