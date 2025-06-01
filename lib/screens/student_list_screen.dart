import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/student_provider.dart';
import '../widgets/student_tile.dart';
import 'student_form_screen.dart';

class StudentListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final studentData = Provider.of<StudentProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Student List')),
      body: ListView.builder(
        itemCount: studentData.students.length,
        itemBuilder: (ctx, i) => StudentTile(student: studentData.students[i]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (ctx) => StudentFormScreen()),
        ),
      ),
    );
  }
}
