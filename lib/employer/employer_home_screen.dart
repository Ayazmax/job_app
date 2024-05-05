import 'package:flutter/material.dart';

class EmployerHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employer Home'),
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.indigo.shade200, Colors.indigo.shade600],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  // Navigate to Add Jobs screen
                  Navigator.pushNamed(context, '/add_jobs');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.indigo,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                ),
                child: Text(
                  'Add Jobs',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to View Jobs screen
                  Navigator.pushNamed(context, '/view_jobs');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.indigo,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                ),
                child: Text(
                  'View Jobs',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
