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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu, size: 32),
        ),
        title: Text(
          "Flutter",
          style: TextStyle(fontSize: 24),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.account_circle, size: 32),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings, size: 32),
          ),
        ],
      ),
      body: Center(
        child: Text(
          "Hello, Flutter! 👋🏻",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: incrementCount,
        child: Text(
          "$count",
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
      ),
    );
  }
}