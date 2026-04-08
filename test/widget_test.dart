import 'package:flutter_test/flutter_test.dart';
import 'package:delivery/main.dart';

void main() {
  testWidgets('App starts with splash screen', (WidgetTester tester) async {
    await tester.pumpWidget(const FoodgoApp());
    expect(find.text('Foodgo'), findsOneWidget);
  });
}
