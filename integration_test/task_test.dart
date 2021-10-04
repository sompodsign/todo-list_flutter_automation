import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:todolist/main.dart' as app;

void main() {
  Duration sleep = const Duration(milliseconds: 1000);
  group('Task add test', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets('Validate adding new task to todo list', (tester) async {
      app.main();
      await tester.pumpAndSettle(sleep);
      final task1 = find.byType(TextField).first;
      await tester.enterText(task1, 'task 1');
      await tester.pumpAndSettle(sleep);
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle(sleep);
      expect(find.text('task 1'), findsOneWidget);
      expect(find.byType(Checkbox), findsOneWidget);
    });
  });
}
