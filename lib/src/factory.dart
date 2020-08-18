import 'package:lightweight_result/src/result.dart';

/// Calls the specified function [block] and returns its encapsulated result if invocation was successful, catching and encapsulating any thrown exception as a failure.
Result<T, Exception> runCatching<T>(T Function() block) {
  try {
    return Result.ok(block());
  } on Exception catch (e) {
    return Result.err(e);
  }
}

/// Calls and await the specified function [block] and returns its encapsulated result if invocation was successful, catching and encapsulating any thrown exception as a failure.
Future<Result<T, Exception>> runCatchingAsync<T>(
    Future<T> Function() block) async {
  try {
    return Result.ok(await block());
  } on Exception catch (e) {
    return Result.err(e);
  }
}

/// Converts a nullable of type [T] to a [Result]. Returns a success if the value is non-null, otherwise the supplied [error].
extension ResultFactory<T, E> on T {
  Result<T, E> toResultOr(E Function() error) {
    if (this != null) {
      return Result.ok(this);
    } else {
      return Result.err(error());
    }
  }
}
