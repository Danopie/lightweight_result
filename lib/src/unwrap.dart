import 'package:lightweight_result/src/result.dart';

extension ResultUnwrap<T, E> on Result<T, E> {
  /// Unwraps a [Result], yielding the [value][Result.value].
  ///
  /// @throws [UnwrapException] if the [Result] is a failure, with a message containing the [error][Result.error].
  T unwrap() {
    if (isSuccess) {
      return value;
    } else {
      throw UnwrapException("called Result.unwrap on a failure: $error");
    }
  }

  /// Unwraps a [Result], yielding the [error][Result.error].
  ///
  /// @throws [UnwrapException] if the [Result] is ok, with a message containing the [value][Result.value].
  E unwrapError() {
    if (isFailure) {
      return error;
    } else {
      throw UnwrapException("called Result.unwrapError on an Ok value $value");
    }
  }
}

class UnwrapException implements Exception {
  final String message;

  const UnwrapException([this.message]);

  @override
  String toString() {
    return 'UnwrapException: $message';
  }
}
