import 'package:flutter/material.dart';
import 'package:flutter_todo/pages/todos.dart';
import 'models/datamanager.dart';
import 'pages/menupage.dart';
import 'pages/orderpage.dart';

void main() {
  runApp(const MyApp());
}

// shortcut stl
// Ctrl + .
class HelloWorld extends StatelessWidget {
  const HelloWorld({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Text("Hello world");
  }
}

class Greet extends StatefulWidget {
  // state variable
  const Greet({super.key});

  @override
  State<Greet> createState() => _GreetState();
}

class _GreetState extends State<Greet> {
  var name = "";
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Hello $name",
          style: const TextStyle(fontSize: 24),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
            onChanged: (value) => setState(() {
                  name = value;
                })),
      ),
    ]);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My TODO App',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget currentWidgetPage = const Text("Hello");
    DataManager dataManager = DataManager();

    switch (selectedIndex) {
      case 0:
        currentWidgetPage = MenuPage(dataManager: dataManager);
        break;
      case 1:
        currentWidgetPage = const Todos();
        break;
      case 2:
        currentWidgetPage = OrderPage(dataManager: dataManager);
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Image.asset("images/logo.png")),
      ),
      body: currentWidgetPage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (newIndex) => {
          setState(() {
            selectedIndex = newIndex;
          })
        },
        selectedItemColor: Colors.tealAccent,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
          BottomNavigationBarItem(
              icon: Icon(Icons.today_outlined), label: "Todos"),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: "Order"),
        ],
      ),
    );
  }
}
