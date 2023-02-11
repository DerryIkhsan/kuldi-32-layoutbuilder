import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        primaryColorBrightness: Brightness.dark,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final widthApp = MediaQuery.of(context).size.width;
    final heightApp = MediaQuery.of(context).size.height;
    final paddingTop = MediaQuery.of(context).padding.top;

    final myAppBar = AppBar(title: Text('Layout Builder'));

    final heightBody = (heightApp - paddingTop - myAppBar.preferredSize.height);

    return Scaffold(
      appBar: myAppBar,
      body: Container(
        width: widthApp,
        height: heightBody * 0.5,
        color: Colors.grey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyContainer(widthApp: widthApp ),
            MyContainer(widthApp: widthApp ),
            MyContainer(widthApp: widthApp ),
          ],
        ),
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  final double widthApp;

  MyContainer({
    Key? key,
    required this.widthApp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: widthApp * 0.25,
          height: constraints.maxHeight * 0.5,
          color: Colors.amber,
        );
      },
    );
  }
}
