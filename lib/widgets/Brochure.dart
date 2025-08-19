import 'package:flutter/material.dart';

class Brochure extends StatelessWidget {
  const Brochure({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Brochure")),
      body: const Center(child: Text("This is Antaragni's Brochure page")),
    );
  }
}
