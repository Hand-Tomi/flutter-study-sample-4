import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// 할 일 클래스
class Todo {
  bool isDone = false;
  String title;

  Todo(this.title);
}

// 시작 클래스
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '할 일 관리',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoListPage(),
    );
  }
}

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  // 할 일 목록을 저장할 리스트
  final _items = <Todo>[];

  // 할 일 문자열 조작을 위한 컨트롤러
  var _todoController = TextEditingController();

  @override
  void dispose() {
    _todoController.dispose(); // 사용이 끝나면 해제
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('남은 할 일'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _todoController,
                  ),
                ),
                RaisedButton(
                  child: Text('추가'),
                  onPressed: () {}, // 뒤에서 계속 작성
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: _items.map((todo) => _buildItemWidget(todo)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 할 일 객체를 ListTile 형태로 변경하는 메서드
  Widget _buildItemWidget(Todo todo) {
    return ListTile(
      onTap: () {},
      title: Text(
        todo.title,
        style: todo.isDone
            ? TextStyle(
                decoration: TextDecoration.lineThrough,
                fontStyle: FontStyle.italic,
              )
            : null,
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete_forever),
        onPressed: () {},
      ),
    );
  }
}
