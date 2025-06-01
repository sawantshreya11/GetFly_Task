import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import '../models/student.dart';
import '../providers/student_provider.dart';

class StudentFormScreen extends StatefulWidget {
  final Student? student;

  StudentFormScreen({this.student});

  @override
  _StudentFormScreenState createState() => _StudentFormScreenState();
}

class _StudentFormScreenState extends State<StudentFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _email;
  late String _dateOfBirth;
  late DateTime _dateOfBirthDateTime;
  late String _contact;
  late String _department;
  late String _year;
  late String _address;

  @override
  void initState() {
    super.initState();
    if (widget.student != null) {
      _name = widget.student!.name;
      _email = widget.student!.email;
      _dateOfBirth = widget.student!.dateOfBirth;
      _dateOfBirthDateTime = DateTime.parse(widget.student!.dateOfBirth);
      _contact = widget.student!.contact;
      _department = widget.student!.department;
      _year = widget.student!.year;
      _address = widget.student!.address;
    } else {
      _name = '';
      _email = '';
      _dateOfBirthDateTime = DateTime.now();
      _dateOfBirth = _dateOfBirthDateTime.toIso8601String().split('T')[0];
      _contact = '';
      _department = '';
      _year = '';
      _address = '';
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final newStudent = Student(
        id: widget.student?.id ?? Uuid().v4(),
        name: _name,
        email: _email,
        dateOfBirth: _dateOfBirth,
        contact: _contact,
        department: _department,
        year: _year,
        address: _address,
      );
      final provider = Provider.of<StudentProvider>(context, listen: false);
      if (widget.student != null) {
        provider.updateStudent(widget.student!.id, newStudent);
      } else {
        provider.addStudent(newStudent);
      }
      Navigator.of(context).pop();
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _dateOfBirthDateTime,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _dateOfBirthDateTime)
      setState(() {
        _dateOfBirthDateTime = picked;
        _dateOfBirth = _dateOfBirthDateTime.toIso8601String().split('T')[0];
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.student != null ? 'Edit Student' : 'Add Student'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Name
              TextFormField(
                initialValue: _name,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter name' : null,
                onSaved: (value) => _name = value!,
              ),
              // Email
              TextFormField(
                initialValue: _email,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter email' : null,
                onSaved: (value) => _email = value!,
              ),
              // Date of Birth
              ListTile(
                title: Text('Date of Birth: $_dateOfBirth'),
                trailing: Icon(Icons.calendar_today),
                onTap: () => _selectDate(context),
              ),
              // Contact
              TextFormField(
                initialValue: _contact,
                decoration: InputDecoration(labelText: 'Contact'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter contact' : null,
                onSaved: (value) => _contact = value!,
              ),
              // Department
              TextFormField(
                initialValue: _department,
                decoration: InputDecoration(labelText: 'Department'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter department' : null,
                onSaved: (value) => _department = value!,
              ),
              // Year
              TextFormField(
                initialValue: _year,
                decoration: InputDecoration(labelText: 'Year'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter year' : null,
                onSaved: (value) => _year = value!,
              ),
              // Address
              TextFormField(
                initialValue: _address,
                decoration: InputDecoration(labelText: 'Address'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter address' : null,
                onSaved: (value) => _address = value!,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text(widget.student != null ? 'Update' : 'Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
