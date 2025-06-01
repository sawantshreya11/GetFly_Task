import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/student.dart';

class StudentProvider with ChangeNotifier {
  List<Student> _students = [];
  bool _initialized = false;
  
  List<Student> get students => [..._students];
  
  StudentProvider() {
    _initStorage();
    // Add a sample student if the list is empty
    _addSampleStudentIfEmpty();
  }
  
  Future<void> _addSampleStudentIfEmpty() async {
    // Wait for initialization to complete
    await Future.delayed(const Duration(milliseconds: 500));
    
    // If no students exist, add a sample one
    if (_students.isEmpty) {
      final sampleStudent = Student(
        id: 'sample-001',
        name: 'John Doe',
        email: 'john.doe@example.com',
        dateOfBirth: '2000-01-15',
        contact: '9876543210',
        department: 'Computer Science',
        year: '3',
        address: '123 University Avenue, Campus Area',
      );
      
      _students.add(sampleStudent);
      saveToStorage();
      notifyListeners();
    }
  }
  
  Future<void> _initStorage() async {
    await loadStudents();
    _initialized = true;
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/students.json');
  }

  Future<void> loadStudents() async {
    try {
      if (kIsWeb) {
        // Web platform storage using SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        final String? studentsJson = prefs.getString('students');
        
        if (studentsJson != null && studentsJson.isNotEmpty) {
          final List<dynamic> decoded = json.decode(studentsJson);
          _students = decoded.map((e) => Student.fromJson(e as Map<String, dynamic>)).toList();
        }
      } else {
        // Mobile/desktop platform storage using File
        final file = await _localFile;
        
        // Check if file exists
        if (await file.exists()) {
          final String contents = await file.readAsString();
          if (contents.isNotEmpty) {
            final List<dynamic> decoded = json.decode(contents);
            _students = decoded.map((e) => Student.fromJson(e as Map<String, dynamic>)).toList();
          }
        }
      }
    } catch (e) {
      debugPrint('Error loading students: $e');
      // If there's an error, initialize with an empty list
      _students = [];
    }
    notifyListeners();
  }

  Future<void> addStudent(Student student) async {
    _students.add(student);
    await saveToStorage();
    notifyListeners();
  }

  Future<void> updateStudent(String id, Student updatedStudent) async {
    final index = _students.indexWhere((s) => s.id == id);
    if (index != -1) {
      _students[index] = updatedStudent;
      await saveToStorage();
      notifyListeners();
    }
  }

  Future<void> deleteStudent(String id) async {
    _students.removeWhere((s) => s.id == id);
    await saveToStorage();
    notifyListeners();
  }

  Future<void> saveToStorage() async {
    try {
      final String data = json.encode(_students.map((s) => s.toJson()).toList());
      
      if (kIsWeb) {
        // Web platform storage using SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('students', data);
      } else {
        // Mobile/desktop platform storage using File
        final file = await _localFile;
        await file.writeAsString(data);
      }
    } catch (e) {
      debugPrint('Error saving students: $e');
    }
  }
}
