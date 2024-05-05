import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:job_app/register/register_screen.dart';
import 'package:job_app/employer/employer_home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  Future<void> loginUser(BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EmployerHomeScreen()),
        );
      }
    } catch (e) {
      print('Login failed: $e');
      // Handle login failure
    }
  }

  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';

    return Scaffold(
      backgroundColor: Colors.grey[200], // Background color
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          'Login',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 30),
            SvgPicture.asset(
              'assets/icons/login.svg',
              height: 200,
            ),
            SizedBox(height: 30),
            TextFormField(
              onChanged: (value) {
                email = value.trim();
              },
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              onChanged: (value) {
                password = value.trim();
              },
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                loginUser(context, email, password);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.indigo,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              child: Text(
                'Login',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              },
              child: Text(
                "Don't have an account? Sign up",
                style: TextStyle(color: Colors.indigo),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
