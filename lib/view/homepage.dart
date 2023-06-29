import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:todo/controller/todoprovider.dart';
import 'package:todo/model/todomodel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: (context, value1, child) => Scaffold(
        backgroundColor: Color.fromARGB(255, 123, 121, 121),
        appBar: AppBar(
          title: Text("TO DO"),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 8, 23, 59),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 24, right: 24, top: 24),
          child: ListView.builder(
              itemCount: value1.todolist.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Checkbox(
                      checkColor: Colors.black,
                      activeColor: Colors.grey,
                      value: value1.todo[index].completed,
                      onChanged: ((_) => value1.toggleTask(value1.todo[index])),
                    ),
                    title: Text(
                      value1.todo[index].todoTitle,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        decoration: value1.todo[index].completed
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Provider.of<TodoProvider>(context, listen: false)
                            .deleteTask(context, index);
                      },
                    ),
                    tileColor: Color.fromARGB(255, 255, 248, 248),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color:  Color.fromARGB(255, 8, 23, 59), width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // style:ListTileStyle(),
                  ),
                );
              }),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor:  Color.fromARGB(255, 8, 23, 59),
            child: Icon(Icons.add),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      //                                           
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color: Color.fromARGB(255, 8, 23, 59),
                          width: 2,
                        )
                      ),
                      content: SizedBox(
                        width: 100,
                        height: 130,
                        child: Column(
                          children: [
                            TextField(
                              controller: value1.name,
                              decoration: InputDecoration(
                                hintText: "enter your todo",
                                enabledBorder: OutlineInputBorder(
                                    // borderSide: BorderSide(
                                    //     width: 3,
                                    //     color: Color.fromARGB(255, 114, 9, 174)),
                                    ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  height: 38,
                                  child: TextButton(
                                      onPressed: () {
                                        Provider.of<TodoProvider>(context,
                                                listen: false)
                                            .addTask(context);
                                        Navigator.pop(context);
                                        value1.name.clear();
                                      },
                                      child: Text("Save",style: TextStyle(color: Colors.black),),
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.0),
                                                  side: BorderSide(
                                                      color: Color.fromARGB(
                                                          255, 8, 23, 59)))))),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                SizedBox(
                                  width: 100,
                                  height: 38,
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Cancel",style: TextStyle(color:Colors.black),),
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                                side: BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 8, 23, 59) )))),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  });
            }),
      ),
    );
  }
}
