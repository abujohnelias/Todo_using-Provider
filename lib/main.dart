import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/controller/todoprovider.dart';
import 'package:todo/view/homepage.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => TodoProvider())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        ),
      );
}
