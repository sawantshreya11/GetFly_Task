import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/student_provider.dart';
import '../models/student.dart';
import '../widgets/student_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the student provider
    final studentProvider = Provider.of<StudentProvider>(context);
    final students = studentProvider.students;
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        title: const Text(
          'Student Portal',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        backgroundColor: const Color(0xFFEF5350), // red theme
        elevation: 4,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/add');
            },
            child: const Text(
              'Add Student',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                // Background Image
                Container(
  width: double.infinity,
  height: 300, // Increased height for more prominence
  decoration: const BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/images/student.jpg'),
      fit: BoxFit.cover,
    ),
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(30),
      bottomRight: Radius.circular(30),
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 15,
        offset: Offset(0, 10),
      ),
    ],
  ),
),

                // Dull overlay with content
                Container(
                  width: double.infinity,
                  height: 300,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 156, 151, 151).withOpacity(0.6),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedOpacity(
                        opacity: 1.0,
                        duration: const Duration(seconds: 2),
                        child: const Text(
                          'Empower Your Academic Life',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Track and manage student data with ease.',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/add');
                        },
                        child: const Text(
                          'ADD NEW STUDENT',
                          style: TextStyle(fontSize: 16, color: Colors.red),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),

            const SizedBox(height: 30),

            // Student List Section
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.red.withOpacity(0.1),
                    blurRadius: 20,
                    spreadRadius: 5,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Header with gradient
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.red.shade400, Colors.red.shade700],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.people_alt, color: Colors.white, size: 28),
                        const SizedBox(width: 10),
                        const Text(
                          'Student Directory',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            '${students.length} Students',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Student List
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: students.isEmpty
                        ? Container(
                            padding: const EdgeInsets.all(30),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade50,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey.shade200),
                            ),
                            child: Column(
                              children: [
                                Icon(Icons.school_outlined, 
                                     size: 60, color: Colors.red.shade200),
                                const SizedBox(height: 15),
                                const Text(
                                  'No students added yet',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'Click "ADD NEW STUDENT" to get started!',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: students.length,
                            itemBuilder: (context, index) {
                              return StudentTile(student: students[index]);
                            },
                          ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
