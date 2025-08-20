import 'package:flutter/material.dart';

class Websitepage extends StatelessWidget {
  const Websitepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Website")),
      body: const Center(child: Text("This is Antaragni's Website page")),
    );
  }
}
