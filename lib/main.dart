import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ekonometri',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ElementCountPage(),
    );
  }
}


class ElementCountPage extends StatefulWidget {
  const ElementCountPage({Key? key}) : super(key: key);

  @override
  State<ElementCountPage> createState() => _ElementCountPageState();
}

class _ElementCountPageState extends State<ElementCountPage> {
  int elementCount = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text('Element count:'),
                hintText: 'Element count must be integer number(6 or 10)',
                hintStyle: TextStyle(fontSize: 13),
              ),
              onChanged: (value){
                elementCount = int.tryParse(value)!;
              },
            ),
          ),
          TextButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomePage(elementCount: elementCount,),
                ),
              );
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}




