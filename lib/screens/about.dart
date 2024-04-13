import 'package:flutter/material.dart';
import 'package:my_app/screens/padalyang.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Kami'),
      ),
      body: Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Warung Padalyang adalah warung makan untuk olahan ikan laut.",
        style: TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 20),
      FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyApp2()),
          );
        },
        child: const Text('Go back!'),
      ),
    ],
  ),
),

    );
  }
}