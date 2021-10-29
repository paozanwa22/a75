import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final countC = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => OtherPage())),
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Center(
        child: CountWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countC.add();
        },
      ),
    );
  }
}

class CountWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CounterController>(
      initState: (_) => print('initstate'),
      didChangeDependencies: (statu) => print('didChangeDependencies'),
      didUpdateWidget: (oldWidget, state) => print('didUpdateWidget'),
      dispose: (state) => print('dispose'),
      builder: (c) => Text('Angka ${c.count}'),
    );
  }
}

class OtherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}

class CounterController extends GetxController {
  var count = 0;

  void add() {
    count++;
    update();
  }
}
