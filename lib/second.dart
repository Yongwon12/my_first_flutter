import 'package:flutter/material.dart';
import 'package:my_first_flutter/main.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const SecondPage());
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const ListPage(),
    );
  }
}

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('유튜브음악 링크페이지'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Card(
              child: ListTile(
                leading: Image.asset(
                  '/Users/gim-yong-won/Desktop/my_first_flutter/image/ballerino.jpeg', // Image path for YouTube logo
                  width: 48,
                  height: 48,
                ),
                title: const Text('Ballerino - MR'),
                subtitle: const Text('눌러서 이동'),
                onTap: () {
                  _launchURL(Uri.parse('https://www.youtube.com/watch?v=6cDlodq4fiM'));
                },
              ),
            ),
          ],
        ),
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
// 링크를 클릭했을때 이동
  void _launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
