import 'package:flutter/material.dart';

class DisplayResult extends StatefulWidget {
  final String Name;
  final String? Department;
  final String? Gender;
  final String? Marital;
  final String? Salary; // Change the type to String

  DisplayResult({
    Key? key,
    required this.Name,
    required this.Department,
    required this.Gender,
    required this.Marital,
    required this.Salary,
  }) : super(key: key);

  @override
  _DisplayResultState createState() => _DisplayResultState();
}

class _DisplayResultState extends State<DisplayResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display Result'),
      ),
      body: ListView(
        children:[ Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: double.infinity,
            
            color: Colors.pink,
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(20),
            // ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Name: ${widget.Name}'),
                  Text('Department: ${widget.Department}'),
                  Text('Gender: ${widget.Gender}'),
                  Text('Marital Status: ${widget.Marital}'),
                  Text('Salary: ${widget.Salary}'), // Use the original Salary as String
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
