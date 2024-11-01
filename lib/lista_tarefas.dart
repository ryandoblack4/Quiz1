import 'package:flutter/material.dart';

void main() {
  runApp(ListaTarefa());
}

class ListaTarefa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LISTA DE TAREFAS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListaTarefaScreen(),
    );
  }
}

class ListaTarefaScreen extends StatefulWidget {
  @override
  _ListaTarefaScreenState createState() => _ListaTarefaScreenState();
}

class _ListaTarefaScreenState extends State<ListaTarefaScreen> {
  final List<String> _todosItens = [];

  // Controladores para os campos de texto
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();

  void _addTodoItem() {
    String nome = _nomeController.text;
    String data = _dataController.text;
    String telefone = _telefoneController.text;

    if (nome.isNotEmpty && data.isNotEmpty && telefone.isNotEmpty) {
      setState(() {
        _todosItens.add("Nome: $nome, Data: $data, Telefone: $telefone");
      });
      _nomeController.clear();
      _dataController.clear();
      _telefoneController.clear(); // Limpa os campos após adicionar
    }
  }

  void _removerTodoItem(int index) {
    setState(() {
      _todosItens.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LISTA DE TAREFAS'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(226, 34, 37, 207),
        leading: IconButton(
          icon: Icon(Icons.menu), // Ícone de menu (três barras)
          onPressed: () {
            print("Menu pressionado");
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // Campo para o nome
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      controller: _nomeController,
                      decoration: InputDecoration(
                        labelText: 'Escreva o Nome',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                // Campo para a data
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      controller: _dataController,
                      decoration: InputDecoration(
                        labelText: 'Escreva a Data',
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.datetime,
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                // Campo para o telefone
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      controller: _telefoneController,
                      decoration: InputDecoration(
                        labelText: 'Escreva o Telefone',
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                // Botão para adicionar tarefa
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addTodoItem,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todosItens.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ListTile(
                    title: Text(_todosItens[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _removerTodoItem(index),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
