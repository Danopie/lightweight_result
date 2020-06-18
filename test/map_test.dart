
import 'package:flutter_test/flutter_test.dart';
import 'package:lightweight_result/lightweight_result.dart';

class MapErr {
  String reason;

  MapErr(this.reason);
}

class HelloError extends MapErr {
  HelloError():super("hello");
}

class WorldError extends MapErr{
  WorldError():super("world");
}

class CustomError extends MapErr {
  CustomError(String error):super(error);
}

void main() {
  group("test map", () {
    test("map() should return transformed value if ok", () {
      expect(Result.ok(10).map((value) => value + 20).get(), 30);
    });

    test("map() should return error if error", () {
      expect(Result.err("Oops").map((value) => value + 20).getError(), "Oops");
    });
  });

  group("test mapError", () {
    test("mapError() should return value if ok", () {
      expect(Result.ok(55).map((value)=> value + 15).mapError((err) => WorldError()).get(), 70);
    });

    test("mapError() should return error if error", () {
      final result = Result.ok("let").map((value) => "$value me").andThen((value){
        switch(value){
          case "let me": return Result.err(CustomError("$value $value"));
          default: return Result.ok("$value get");
        }
      }).mapError((error) => CustomError("${error.reason} get what i want"));
      expect(result.getError().reason, "let me let me get what i want");
    });
  });

  group("test mapOr", () {
    test("mapOr() should return transformed value if ok", () {
      expect(Result.ok("foo").mapOr((value) => value.length, 42).get(), 3);
    });

    test("mapOr() should return default value if error", () {
      expect(Result.err("foo").mapOr((value) => value.length, 42).get(), 42);
    });
  });

  group("test mapOrElse", () {
    test("mapOrElse() should return transformed value if ok", () {
      var k = 21;
      expect(Result.ok("foo").mapOrElse((value) => value.length, (error) => k * 2).get(), 3);
    });

    test("mapOrElse() should return default value if error", () {
      var k = 21;
      expect(Result.err("foo").mapOrElse((value) => value.length, (error) => k * 2).get(), 42);
    });
  });

  group("test fold", () {
    test("fold() should return success if ok", () {
      expect(Result.ok("foo").fold<int>((value) => 2, (error) => 5), 2);
    });

    test("fold() should return failure if error", () {
      expect(Result.err("foo").fold<int>((value) => 2, (error) => 5), 5);
    });
  });

  group("test mapEither", () {
    test("mapEither() should return success if ok", () {
      final result = Result.ok(500).mapEither((value) => value + 500, (error) => CustomError("$error"));

      expect(result.get(), 1000);
    });

    test("mapEither() should return failure if error", () {
     final result = Result.err("the reckless").mapEither((value) => "the wild youth", (error) => CustomError("the truth"));

     expect(result.error.reason, "the truth");
    });
  });
}
