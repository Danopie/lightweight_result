import 'package:flutter_test/flutter_test.dart';
import 'package:lightweight_result/lightweight_result.dart';

class AndError implements Exception {}

void main() {
  group("test and", () {
    test("and() should return value upon success", () {
      expect(Result.ok(230).and(() => Result.ok(500)).get(), 500);
    });

    test("and() should return new error upon success", () {
      expect(Result.ok(300).and(() => Result.err(AndError())).getError(),
          isA<AndError>());
    });
  });

  group("test andThen", () {
    test("andThen() should return transformed value upon success", () {
      expect(Result.ok(5).andThen((value) => Result.ok(value + 7)).get(), 12);
    });

    test("andThen() should return new error upon failure", () {
      expect(
          Result.ok(20)
              .andThen((value) => Result.ok(value + 43))
              .andThen((value) => Result.err(AndError()))
              .getError(),
          isA<AndError>());
    });
  });
}
