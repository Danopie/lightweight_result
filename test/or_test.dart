import 'package:flutter_test/flutter_test.dart';
import 'package:lightweight_result/lightweight_result.dart';

void main() {
  group("test or", () {
    test("or() should return value if ok", () {
      expect(Result.ok(50).or(() => Result.ok(100)).get(), 50);
    });

    test("or() should return default value if error", () {
      expect(Result.err("Oops").or(() => Result.ok(100)).get(), 100);
    });
  });

  group("test orElse", () {
    test("orElse() should return value if ok", () {
      expect(Result.ok(50).orElse((error) => Result.ok(100)).get(), 50);
    });

    test("orElse() should return transformed value if error", () {
      expect(Result.err("Oops").orElse((error) => Result.ok(100)).get(), 100);
    });

  });

  group("test recover", () {
    test("recover() should return value if ok", () {
      expect(Result.ok(50).recover((error) => 100).get(), 50);
    });

    test("recover() should return transformed value if error", () {
      expect(Result.err("Oops").recover((error) => 100).get(), 100);
    });

  });

}
