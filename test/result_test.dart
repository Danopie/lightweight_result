import 'package:flutter_test/flutter_test.dart';
import 'package:result_monad/result_monad.dart';

void main() {
  test("Result should reflect isSuccess correctly", () {
    final result = Result<String, String>.ok("5");
    expect(result.isSuccess, isTrue);
    expect(result.isFailure, isFalse);
  });

  test("Result should reflect isFailure correctly", () {
    final result = Result<String, String>.failure("5");
    expect(result.isSuccess, isFalse);
    expect(result.isFailure, isTrue);
  });

  test("Result should be comparable", () {
    final result1 = Result<String, String>.failure("5");
    final result2 = Result<String, String>.failure("5");
    final result3 = Result<String, String>.failure("7");
    final result4 = Result<String, String>.ok("5");
    final result5 = Result<String, String>.ok("5");
    expect(result1, equals(result2));
    expect(result1, isNot(equals(result3)));
    expect(result1, isNot(equals(result4)));
    expect(result4, equals(result5));
  });

}
