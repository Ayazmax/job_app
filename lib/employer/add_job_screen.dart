import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class AddJobScreen extends StatelessWidget {
  final DatabaseReference _database = FirebaseDatabase.instance.reference();

  TextEditingController jobNameController = TextEditingController();
  TextEditingController jobTypeController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController requirementsController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController contactNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Future<void> addJob(BuildContext context) async {
    try {
      // Save job data to Realtime Database
      await _database.child('jobs').push().set({
        'jobName': jobNameController.text.trim(),
        'jobType': jobTypeController.text.trim(),
        'companyName': companyNameController.text.trim(),
        'requirements': requirementsController.text.trim(),
        'salary': salaryController.text.trim(),
        'contactNo': contactNoController.text.trim(),
        'email': emailController.text.trim(),
        // Add more job data as needed
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Job added successfully')),
      );
    } catch (e) {
      print('Adding job failed: $e');
      // Handle failure
      // For example:
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add job. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Job'),
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
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: jobNameController,
                    decoration: InputDecoration(
                      labelText: 'Job Name',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: jobTypeController,
                    decoration: InputDecoration(
                      labelText: 'Job Type',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: companyNameController,
                    decoration: InputDecoration(
                      labelText: 'Company Name',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: requirementsController,
                    maxLines: null, // Allow multiple lines
                    decoration: InputDecoration(
                      labelText: 'Requirements',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: salaryController,
                    decoration: InputDecoration(
                      labelText: 'Salary',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: contactNoController,
                    decoration: InputDecoration(
                      labelText: 'Contact Number',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          addJob(context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.indigo,
                          padding: EdgeInsets.symmetric(vertical: 15),
                        ),
                        child: Text(
                          'Add Job',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
