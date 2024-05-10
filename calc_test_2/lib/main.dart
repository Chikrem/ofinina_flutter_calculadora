import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Tarefa/tarefa_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tarefas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: MyHomePage(),
    ); // MaterialApp
  }
}

class MyHomePage extends StatelessWidget {

  final TarefaController tarefaController = TarefaController();

  @override
    Widget build(BuildContext){
      return Scaffold(
        body: Observer(
          builder: (_) => ListView.builder(
            itemBuilder: (_, i) => ListTile(
              title: Text(tarefaController.tarefas.toList()[i]),
            ), // ListTitle
            itemCount: tarefaController.tarefas.toList().length,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: tarefaController.adicionaTarefa,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      );
  }
}