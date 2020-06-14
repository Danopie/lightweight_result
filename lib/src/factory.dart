import 'package:result_monad/src/result.dart';

Result<T, Exception> runCatching<T>(T Function() func) {
  try {
    return Result.ok(func());
  } on Exception catch (e) {
    return Result.failure(e);
  }
}
