import 'package:flutter_test/flutter_test.dart';
import 'package:lightweight_result/lightweight_result.dart';

class CallbackException implements Exception {}

void main() {
  group("test runCatching", () {
    test("runCatching() should return value upon success", () {
      final callback = (){
        return "example";
      };

      expect(runCatching(callback).get(), "example");
    });

    test("runCatching() should return exception upon success", () {
      final callback = (){
        throw CallbackException();
      };

      expect(runCatching(callback).get(), isNull);
      expect(runCatching(callback).getError(), isA<CallbackException>());
    });
  });

  group("test toResultOr", () {
    test("toResultOr() should return success if not null", () {
      expect("ok".toResultOr(() => "wait").get(), "ok");
    });

    test("toResultOr() should return error if null", () {
      expect(null.toResultOr(() => "wait").getError(), "wait");
      expect(null.toResultOr(() => "wait").get(), isNull);
    });
  });

}
