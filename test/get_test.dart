import 'package:flutter_test/flutter_test.dart';
import 'package:result_monad/result_monad.dart';

void main() {
  group("test get()", () {
    test("get() should return value upon success", () {
      final result = Result<String, String>.ok("5");
      expect(result.get(), "5");
    });

    test("get() should return null upon failure", () {
      final result = Result<String, String>.failure("Not parsable");
      expect(result.get(), isNull);
    });
  });

  group("test getError()", () {
    test("getError() should return null upon success", () {
      final result = Result<String, String>.ok("5");
      expect(result.getError(), isNull);
    });

    test("get() should return null upon failure", () {
      final result = Result<String, String>.failure("Not parsable");
      expect(result.getError(), "Not parsable");
    });
  });

  group("test getOr()", () {
    test("getOr() should return value upon success", () {
      final result = Result<String, String>.ok("5");
      expect(result.getOr(() => "10"), "5");
    });

    test("getOr() should return default value upon failure", () {
      final result = Result<String, String>.failure("Not parsable");
      expect(result.getOr(() => "10"), "10");
    });
  });

  group("test getErrorOr()", () {
    test("getErrorOr() should return error upon failure", () {
      final result = Result<String, String>.failure("An error");
      expect(result.getErrorOr(() => "Another error"), "An error");
    });

    test("getErrorOr() should return default error upon success", () {
      final result = Result<String, String>.ok("5");
      expect(result.getErrorOr(() => "Another error"), "Another error");
    });
  });

  group("test getOrElse()", () {
    test("getOrElse() should return new value upon error", () {
      final result = Result<int, String>.failure("An error");
      expect(result.getOrElse((error) => 5), 5);
    });

    test("getOrElse() should return value upon success", () {
      final result = Result<int, String>.ok(1);
      expect(result.getOrElse((error) => 2), 1);
    });
  });

  group("test getErrorOrElse()", () {
    test("getErrorOrElse() should return new error upon success", () {
      final result = Result<int, String>.ok(5);
      expect(result.getErrorOrElse((value) => "New error"), "New error");
    });

    test("getErrorOrElse() should return error upon failure", () {
      final result = Result<int, String>.failure("An error");
      expect(result.getErrorOrElse((value) => "New error"), "An error");
    });
  });
}
