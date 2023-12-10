import 'package:flutter/material.dart';

class Todos extends StatelessWidget {
  const Todos({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Todo(title: "TODO 1", description: "Do sth"),
        Todo(title: "TODO 1", description: "Do sth"),
        Todo(title: "TODO 1", description: "Do sth"),
        Todo(title: "TODO 1", description: "Do sth"),
        Todo(title: "TODO 1", description: "Do sth"),
        Todo(title: "TODO 1", description: "Do sth"),
        Todo(title: "TODO 1", description: "Do sth"),
        Todo(title: "TODO 1", description: "Do sth"),
        Todo(title: "TODO 1", description: "Do sth"),
      ],
    );
  }
}

class Todo extends StatelessWidget {
  // Properties (immutable)
  final String title;
  final String description;

  const Todo({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Card(
        color: Colors.amber,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("images/background.png"),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Container(
                  color: Colors.cyan,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.redAccent,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      description,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
