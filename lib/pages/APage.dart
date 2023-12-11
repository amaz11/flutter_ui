// ignore: file_names
import 'package:flutter/material.dart';

class APage extends StatelessWidget {
  const APage({super.key});

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green[400],
          title: Center(
            child: Text(
              "$arg",
              style: const TextStyle(
                fontSize: 18.5,
                color: Colors.white,
              ),
            ),
          )),
      body: const Center(child: Text('You are in the APage')),
    );
  }
}
