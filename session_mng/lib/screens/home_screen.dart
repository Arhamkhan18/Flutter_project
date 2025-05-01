import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/session_model.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final session = Provider.of<SessionModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Session Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              session.isLoggedIn
                  ? 'Welcome, ${session.username}!'
                  : 'You are not logged in.',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (session.isLoggedIn) {
                  session.logout();
                } else {
                  session.login('FlutterDev');
                }
              },
              child: Text(session.isLoggedIn ? 'Logout' : 'Login'),
            ),
          ],
        ),
      ),
    );
  }
}
