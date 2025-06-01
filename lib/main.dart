import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/student_provider.dart';
import 'screens/home_screen.dart';
import 'screens/add_edit_student_screen.dart';

void main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();
  
  // Create the provider
  final studentProvider = StudentProvider();
  
  // Run the app
  runApp(MyApp(studentProvider: studentProvider));
}

class MyApp extends StatelessWidget {
  final StudentProvider studentProvider;
  
  const MyApp({super.key, required this.studentProvider});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: studentProvider,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Student Manager',
        theme: ThemeData(
          primarySwatch: Colors.red,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Roboto',
          inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
              elevation: 4,
              shadowColor: Colors.redAccent,
            ),
          ),
        ),
        home: const HomeScreen(),
        routes: {
          '/add': (context) => const AddEditStudentScreen(),
        },
      ),
    );
  }
}
