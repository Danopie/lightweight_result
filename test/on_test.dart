import 'package:flutter_test/flutter_test.dart';
import 'package:lightweight_result/lightweight_result.dart';

class Counter {
  int count;
  Counter(this.count);
}

class CounterError {}

void main() {
  group("test onSuccess", () {
    test("onSuccess() should invoke action if success", () {
      final counter = Counter(50);
      Result.ok(counter).onSuccess((_) {
        counter.count += 50;
      });
      expect(counter.count, 100);
    });

    test("onSuccess() should invoke nothing if failure", () {
      final counter = Counter(50);
      Result.failure(counter).onSuccess((_) {
        counter.count += 50;
      });
      expect(counter.count, 50);
    });
  });

  group("test onFailure", () {
    test("onFailure() should invoke nothing if success", () {
      final counter = Counter(50);
      Result.ok(counter).onFailure((_) {
        counter.count +=  50;
      });
      expect(counter.count, 50);
    });

    test("onFailure() should invoke action if error", () {
      final counter = Counter(50);
      Result.failure(counter).onFailure((_) {
        counter.count += 50;
      });
      expect(counter.count, 100);
    });
  });
}
