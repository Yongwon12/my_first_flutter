import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: isLoading
          ? const Scaffold(
        body: Center(
          child: SpinKitFadingCircle(
            color: Colors.grey,
            size: 50.0,
          ),
        ),
      )
          : Scaffold(
        appBar: AppBar(
          title: const Text('플러터 테스트'),
        ),
        body: ListView(
          children: const [
            ListTile(
              title: Text('Post 1'),
              subtitle: Text('This is the content of post 1.'),
            ),
            ListTile(
              title: Text('Post 2'),
              subtitle: Text('This is the content of post 2.'),
            ),
            ListTile(
              title: Text('Post 3'),
              subtitle: Text('This is the content of post 3.'),
            ),
          ],
        ),
      ),
    );
  }
}
