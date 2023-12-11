// ignore: file_names
import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  final String? name;
  const NewPage({super.key, this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green[400],
          title: Center(
              child: Text(
            "$name",
            style: const TextStyle(
              fontSize: 18.5,
              color: Colors.white,
            ),
          ))),
      body: const Center(child: Text('You are in the NewPage')),
    );
  }
}
