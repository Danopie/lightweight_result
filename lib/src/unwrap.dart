import 'package:lightweight_result/src/result.dart';

extension ResultUnwrap<T, E> on Result<T, E> {
  T unwrap() {
    if (isSuccess) {
      return value;
    } else {
      throw UnwrapException("called Result.unwrap on a failure: $error");
    }
  }

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
    return 'UnwrapException: $message}';
  }
}
