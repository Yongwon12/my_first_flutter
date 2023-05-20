import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// 앱을 실행시키는 runApp 함수
void main() {
  runApp(const MyApp());
}
// StatefulWidget를 상속하여 위젯을 정의
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
// createState()메서드를 오버라이딩하여 MyAppState 객체를 생성
  @override
  State<MyApp> createState() => _MyAppState();
}
// _MyAppState 클래스:
// State 클래스를 상속하여 상태를 관리합니다.
// isLoading 변수를 선언하여 로딩 상태를 관리합니다. 초기값은 true로 설정됩니다.
class _MyAppState extends State<MyApp> {
  // 로딩화면 기본값
  bool isLoading = true;
  // initState() 메서드:
  // 위젯의 초기화를 수행하는 메서드입니다. super.initState()를 호출하여 부모 클래스의 초기화 메서드를 실행합니다.
  // Future.delayed() 함수를 사용하여 4초 후에 로딩이 완료되었다고 가정하고, isLoading 변수를 false로 업데이트합니다. 이후 setState()를 호출하여 위젯을 다시 그립니다.
  @override
  void initState() {
    super.initState();
    // 비동기 작업 등을 수행하여 데이터를 로드하거나 초기화할 수 있습니다.
    // 로딩이 완료되면 isLoading 변수를 업데이트하고, setState()를 호출하여 화면을 다시 그립니다.
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        // 업데이트된 로딩화면 값
        isLoading = false;
      });
    });
  }
  // build() 메서드:
  // 위젯의 UI를 빌드하는 메서드입니다. BuildContext를 매개변수로 받습니다.
  // MaterialApp을 반환합니다.
  // isLoading 값에 따라 로딩 화면 또는 홈 화면을 표시합니다.
  // isLoading이 true인 경우, Scaffold 위젯의 body 속성에 SpinKitFadingCircle 위젯을 표시하여 로딩 화면을 구성합니다.
  // isLoading이 false인 경우, Scaffold 위젯의 appBar 속성에 앱바를, body 속성에 "Hello, Flutter!" 텍스트를 가진 Center 위젯을 표시하여 홈 화면을 구성합니다.
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
        body: const Center(
          child: Text(
            'Hello, Flutter!',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
// 앱이 실행되면 main() 함수가 호출됩니다.
// MyApp 위젯이 실행되며, _MyAppState 객체가 생성됩니다.
// _MyAppState 클래스의 initState() 메서드가 호출되어 초기화 작업을 수행합니다.
// Future.delayed() 함수를 사용하여 4초 후에 isLoading 변수를 false로 업데이트하고, setState()를 호출하여 위젯을 다시 그립니다.
// build() 메서드가 호출되어 UI를 구성하고, isLoading 값에 따라 로딩 화면 또는 홈 화면이 표시됩니다.
// 4초 후에 isLoading 변수가 false로 업데이트되어 홈 화면으로 전환됩니다.