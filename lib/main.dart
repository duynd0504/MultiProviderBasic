import 'package:flutter/material.dart';
import 'package:flutter_multiprovider_app/models/counter.dart';
import 'package:flutter_multiprovider_app/settings.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => MySettings(),
      ),
      ChangeNotifierProvider(
        create: (_) => Counter(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: context.watch<MySettings>().isDrak
            ? Brightness.dark
            : Brightness.light,
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Provider'),
        actions: [
          Switch(
              value: context.watch<MySettings>().isDrak,
              onChanged: (newValue) {
                Provider.of<MySettings>(context, listen: false)
                    .setTheme(newValue);
              }),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You have pushed this button many times :'),
            SizedBox(
              height: 50,
            ),
            Text(
              context.watch<Counter>().myValue.toString(),
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Provider.of<Counter>(context, listen: false).add();
          },
          child: Icon(Icons.add)),
    );
  }
}
