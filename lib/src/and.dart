import 'package:result_monad/src/result.dart';

extension ResultAnd<T, E> on Result<T, E> {
  /// Returns [value] if this [Result] is a success, otherwise this [error].
  Result<T, E> and(Result<T, E> Function() result) {
    if (isSuccess)
      return result();
    else
      return this;
  }

  /// Maps this [Result<T, E>][Result] to [Result<U, E>][Result] by either applying the [transform]
  /// function if this [Result] is a success, or returning this [error].
  Result<U, E> andThen<U>(Result<U, E> Function(T) transform) {
    if (isSuccess)
      return transform(value);
    else
      return Result.failure(error);
  }
}
