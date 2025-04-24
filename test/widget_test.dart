import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_2/main.dart';

void main() {
  testWidgets('Movie Review Form Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: ReviewForm()));

    // Enter text in text fields
    await tester.enterText(find.byKey(Key('nameField')), 'John');
    await tester.enterText(find.byKey(Key('surnameField')), 'Doe');
    await tester.enterText(find.byKey(Key('dobField')), '01-01-2000');
    await tester.enterText(find.byKey(Key('addressField')), '123 Street');
    await tester.enterText(find.byKey(Key('emailField')), 'john.doe@example.com');
    await tester.enterText(find.byKey(Key('phoneField')), '1234567890');
    await tester.enterText(find.byKey(Key('reviewField')), 'Great movie!');

    // Select gender
    await tester.tap(find.byKey(Key('maleRadio')));
    await tester.pump();

    // Submit form
    await tester.tap(find.byKey(Key('submitButton')));
    await tester.pumpAndSettle();

    // Verify that snackbar appears
    expect(find.text("Review Submitted Successfully!"), findsOneWidget);
  });
}
