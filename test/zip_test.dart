import 'package:flutter_test/flutter_test.dart';
import 'package:lightweight_result/lightweight_result.dart';

void main() {
  group("test zip", () {
    test("zip2() should return transformed value if both are ok", () {
      final result =
          zip2(() => Result.ok(10), () => Result.ok(20), (v1, v2) => v1 + v2);

      expect(result.get(), 30);
    });

    test("zip2() should return error if one of two is an error", () {
      final result =
      zip2(() => Result.ok(10), () => Result.ok(20).and(() => Result.err("Error")), (v1, v2) => v1 + v2);

      expect(result.get(), null);
      expect(result.getError(), "Error");
    });

    test("zip2() should return first error if both are errors", () {
      final result =
      zip2(() => Result.ok(10).and(() => Result.err("Error1")), () => Result.ok(20).and(() => Result.err("Error2")), (v1, v2) => v1 + v2);

      expect(result.get(), null);
      expect(result.getError(), "Error1");
    });
  });
}
