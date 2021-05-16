import 'package:flutter/material.dart';
import 'package:todo/const.dart';


class TodoContent extends StatelessWidget {

  final int index;
  TodoContent(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal:24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Align(
                alignment: Alignment.topRight,
                child: Icon(Icons.clear,
                size: 30.0,
                color: Colors.black,
                ),
                ),
              ),
              Text(
                    todos[index].title,
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w600
                    )
                  ),
                  SizedBox(height:10.0),
              Container(
                  child: Row(
                    children: [
                      Text('Date: ',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 18.0
                      )),
                      Text(
                        todos[index].date,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0
                        )
                      ),
                    ],),
              ),
              SizedBox(height:20.0),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Text('Description',
                       style: TextStyle(
                         color: Colors.green,
                         fontSize: 18.0,
                       ),
                    ),
                    Text('to be completed',
                       style: TextStyle(
                         color: Colors.red,
                         fontSize: 15.0,
                         fontWeight: FontWeight.bold
                       ),
                    )
                    ],),
                    SizedBox(height: 5.0,),
                    Expanded(
                      child: Scrollbar(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [BoxShadow(
                            color: Colors.grey[400].withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                          )]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                          todos[index].description,
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 18.0
                            )
                            ),
                        )
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(7.0)
                            ),
                          width: 200,
                          height: 70,
                          
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                              child: Center(
                              child: Text('SAVE',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0
                              ),
                              
                              ),
                            ),
                          )
                          ),
                        ),
                       
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            width: 1.0,
                            color: Colors.black
                          )
                          ),
                        width: 80,
                        height: 68,
                        
                        child: Icon(
                          Icons.edit,
                          color: Colors.black,
                          size: 40.0,
                        ),
                      )
                      
                    ],),
                    SizedBox(
                      height: 8.0,
                    )
          ],)
        ),
      )
      
    );
  }
}