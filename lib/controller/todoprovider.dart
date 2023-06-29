import 'package:flutter/widgets.dart';
import 'package:todo/model/todomodel.dart';

class TodoProvider extends ChangeNotifier {
  List<TodoModel> todolist = [];
  TextEditingController name = TextEditingController();
  List<TodoModel> get todo => todolist;

  void addTask(BuildContext context) {
    todolist.add(TodoModel(todoTitle: name.text, completed: false));
    notifyListeners();
  }

  void deleteTask(BuildContext context, int index) {
    todolist.remove(todo[index]);
    notifyListeners();
  }

  void toggleTask(TodoModel task) {
    final taskIndex = todolist.indexOf(task);
    todolist[taskIndex].toggleCompleted();
    notifyListeners();
  }
}
