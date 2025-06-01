import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import '../models/student.dart';
import '../providers/student_provider.dart';
import '../utils/validators.dart';

class AddEditStudentScreen extends StatefulWidget {
  final Student? student;
  const AddEditStudentScreen({super.key, this.student});

  @override
  State<AddEditStudentScreen> createState() => _AddEditStudentScreenState();
}

class _AddEditStudentScreenState extends State<AddEditStudentScreen> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> _controllers = {};
  final _uuid = const Uuid();

  @override
  void initState() {
    super.initState();
    final fields = [
      'name',
      'email',
      'date_of_birth',
      'contact',
      'department',
      'year',
      'address'
    ];
    for (var field in fields) {
      _controllers[field] = TextEditingController(
        text: widget.student != null
            ? widget.student!.toJson()[field == 'date_of_birth' ? 'date_of_birth' : field]
            : '',
      );
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  void _saveStudent() {
    if (_formKey.currentState!.validate()) {
      final newStudent = Student(
        id: widget.student?.id ?? _uuid.v4(), // Generate a new UUID if adding a new student
        name: _controllers['name']!.text,
        email: _controllers['email']!.text,
        dateOfBirth: _controllers['date_of_birth']!.text,
        contact: _controllers['contact']!.text,
        department: _controllers['department']!.text,
        year: _controllers['year']!.text,
        address: _controllers['address']!.text,
      );

      final provider = Provider.of<StudentProvider>(context, listen: false);
      widget.student == null
          ? provider.addStudent(newStudent)
          : provider.updateStudent(widget.student!.id, newStudent);
      Navigator.pop(context);
    }
  }

  Widget _buildTextField(
    String key,
    String label, {
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: _controllers[key],
        keyboardType: keyboardType,
        maxLines: maxLines,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.red.shade50,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.student == null ? 'Add Student' : 'Edit Student'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField('name', 'Full Name', validator: validateNotEmpty),
              _buildTextField('email', 'Email', keyboardType: TextInputType.emailAddress, validator: validateEmail),
              _buildTextField('date_of_birth', 'Date of Birth (YYYY-MM-DD)', validator: validateDate),
              _buildTextField('contact', 'Contact Number', keyboardType: TextInputType.phone, validator: validatePhone),
              _buildTextField('department', 'Department', validator: validateNotEmpty),
              _buildTextField('year', 'Year', keyboardType: TextInputType.number, validator: validateYear),
              _buildTextField('address', 'Address', validator: validateNotEmpty, maxLines: 2),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveStudent,
                child: Text(widget.student == null ? 'Add Student' : 'Update Student'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
