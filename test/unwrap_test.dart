import 'package:flutter_test/flutter_test.dart';
import 'package:lightweight_result/lightweight_result.dart';

void main() {
  group("test unwrap", () {
    test("unwrap() should return value upon success", () {
      expect(Result.ok(230).unwrap(), 230);
    });

    test("unwrap() should throw exception upon failure", () {
      expect(() => Result.err("Error").unwrap(), throwsA(isA<UnwrapException>()));
    });
  });

  group("test unwrapError", () {
    test("unwrapError() should return error upon failure", () {
      expect(() => Result.ok(230).unwrapError(), throwsA(isA<UnwrapException>()));
    });

    test("unwrapError() should return error upon failure", () {
      expect(Result.err("Error").unwrapError(), "Error");
    });
  });
}
