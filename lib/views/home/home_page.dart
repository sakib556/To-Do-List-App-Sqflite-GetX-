import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("To-do List"),
          backgroundColor: Colors.deepPurple,
        ),
        body: Container(
          child: Column(
            children: [],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.deepPurple,
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
