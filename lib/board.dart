import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'main.dart';
// API 사용
void main() {
  runApp(const BoardPage());
}

class BoardPage extends StatefulWidget {
  const BoardPage({Key? key}) : super(key: key);

  @override
  _BoardScreenState createState() => _BoardScreenState();
}
class _BoardScreenState extends State<BoardPage> {
  List<dynamic> boardData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('http://192.168.219.161:8000/api/board'));

    if (response.statusCode == 200) {
      setState(() {
        boardData = jsonDecode(response.body)['boardwrite'];
      });
    } else {
      // 오류 처리
      print('Failed to fetch data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Board'),
      ),
      body: ListView.builder(
        itemCount: boardData.length,
        itemBuilder: (BuildContext context, int index) {
          final board = boardData[index];
          return ListTile(
            title: Text(board['title']),
            subtitle: Text(board['description']),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(board['profileimage']),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.home),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=>const MyHomePage()));
        },
      ),
    );
  }
}
