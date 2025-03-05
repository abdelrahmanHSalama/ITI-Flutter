import "package:flutter/material.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int count = 0;

  void incrementCount() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: Row(
          children: [
            Container(width: 105, color: Colors.red),
            Expanded(
                child: Center(child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(width: 80, height: 80, color: Colors.yellow),
                    Container(width: 80, height: 80, color: Colors.green)
                  ],
                )
                )
            ),
            Container(width: 105, color: Colors.blue),
          ]
      )
    );
  }
}