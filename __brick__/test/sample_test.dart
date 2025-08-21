import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Sample test', () {
    test('Sum should return correct amount', () {
      // Arrange
      const a = 1;
      const b = 4;
      // Act & Assert
      expect(a + b, equals(5));
    });
  });
}
