import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:login/main.dart';

void main() {
  testWidgets('Login page widget test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Verify that the login page is displayed
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Username'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);

    // Enter username and password
    await tester.enterText(find.byType(TextField).first, 'test_username');
    await tester.enterText(find.byType(TextField).last, 'test_password');

    // Tap the login button
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verify that the login button is tapped
    expect(find.text('Login'), findsNothing);
    expect(find.text('Username: test_username'), findsOneWidget);
    expect(find.text('Password: test_password'), findsOneWidget);
  });
}