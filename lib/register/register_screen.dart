import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:job_app/login/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final DatabaseReference _database = FirebaseDatabase.instance.reference();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  String userType = 'Employee'; // Default user type

  final _formKey = GlobalKey<FormState>();

  Future<void> registerUser(BuildContext context) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;

      // Create user with Firebase Authentication
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Save additional user data to Realtime Database
      await _database.child('users').child(userCredential.user!.uid).set({
        'email': emailController.text.trim(),
        'password': passwordController.text.trim(),
        'username': usernameController.text.trim(),
        'userType': userType,
        // Add more user data as needed
      });

      // Navigate to another screen after successful registration
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } catch (e) {
      print('Registration failed: $e');
      // Handle registration failure
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Register',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  // You can add more complex email validation if needed
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  // You can add more complex password validation if needed
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  // You can add more complex username validation if needed
                  return null;
                },
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: userType,
                onChanged: (value) {
                  // Update the userType value when the user selects a different option
                  setState(() {
                    userType = value!;
                  });
                },
                items: <String>['Employee', 'Employer']
                    .map((String value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                ))
                    .toList(),
                decoration: InputDecoration(
                  labelText: 'User Type',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
            SizedBox(
              width: double.infinity, // Set the width to match the parent's width
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    registerUser(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.indigo,
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                child: Text(
                  'Register',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Text(
                  'Already have an account? Login',
                  style: TextStyle(color: Colors.indigo),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
