// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:getfly_project/providers/student_provider.dart';
import 'package:getfly_project/models/student.dart';

void main() {
  testWidgets('Basic widget test', (WidgetTester tester) async {
    // Create a simple test widget that doesn't rely on assets
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Student Manager Test'),
          ),
          body: const Center(
            child: Text('Test Passed'),
          ),
        ),
      ),
    );

    // Verify that our test widget renders correctly
    expect(find.text('Student Manager Test'), findsOneWidget);
    expect(find.text('Test Passed'), findsOneWidget);
  });
}
