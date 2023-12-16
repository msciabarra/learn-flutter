import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
      create: (context) => HelloModel(),
      child: HelloApp(),
    ));

class HelloModel extends ChangeNotifier {
  var count = 0;
  void inc() {
    count += 1;
    notifyListeners();
  }
}

class HelloApp extends StatelessWidget {
  const HelloApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello',
      home: HelloHome(),
    );
  }
}

class HelloHome extends StatelessWidget {
  const HelloHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HelloCounter());
  }
}

class HelloCounter extends StatelessWidget {
  const HelloCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<HelloModel>(builder: (context, hello, child) {
          return Text('${hello.count}');
        }),
        ElevatedButton(
          onPressed: () {
            //Provider.of<HelloModel>(context, listen: false).inc();
            context.read<HelloModel>().inc();
          },
          child: Text("Increment"),
        ),
      ],
    );
  }
}
