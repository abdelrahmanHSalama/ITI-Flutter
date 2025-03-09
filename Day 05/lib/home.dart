import "package:flutter/material.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messaging App"),
        backgroundColor: Colors.blue,
      ),
      body: Padding( // Wrap Column in Padding for spacing
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Login",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: "Username",
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            PasswordField(),
            SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: double.infinity, // Makes the button take full width
                child: ElevatedButton(
                  onPressed: () {
                    print("Button Pressed!");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Button color
                    padding: EdgeInsets.symmetric(vertical: 15), // Increases height
                  ),
                  child: Text(
                    "Click Me",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              )
            )
          ],

        ),
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isObscure = true; // Controls visibility

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _isObscure, // Toggles password visibility
      decoration: InputDecoration(
        labelText: "Password",
        prefixIcon: Icon(Icons.key),
        border: OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure; // Toggle visibility state
            });
          },
        ),
      ),
    );
  }
}
