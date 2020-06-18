import 'package:lightweight_result/src/result.dart';

extension ResultOr<T, E> on Result<T, E> {

  /// Returns [result] if this [Result] is [Err], otherwise this [Ok].
  Result<T, E> or(Result<T, E> Function() result) {
    if (isSuccess) {
      return this;
    } else {
      return result();
    }
  }

  /// Returns the [transformation][transform] of the [error][Result.error] if this [Result] is [Err],
  /// otherwise this [Ok].
  Result<T, E> orElse(Result<T, E> Function(E) transform) {
    if (isSuccess) {
      return this;
    } else {
      return transform(error);
    }
  }

  /// Returns the [transformation][transform] of the [error][Result.error] if this [Result] is [Err],
  /// otherwise this [Ok].
  Result<T, E> recover(T Function(E) transform) {
    if (isFailure && transform != null) {
      return Result.ok(transform(error));
    } else {
      return this;
    }
  }
}
