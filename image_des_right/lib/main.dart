import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Side by Side Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image and Description'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image
              Image.asset(
                'assets/tshirt.jpg',
                width: 100,
              ),

              SizedBox(width: 20), // Space between image and text

              // Description Text
              Expanded(
                child: Text(
                  'Comfortable tshirt without logo',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
