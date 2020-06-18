import 'package:lightweight_result/src/result.dart';

extension ResultGet<T, E> on Result<T, E> {

  /// Returns the [value][Result.value] if this [Result] is a success, otherwise `null`.
  T get() => isSuccess ? value : null;

  /// Returns the [error][Result.error] if this [Result] is a failure, otherwise `null`.
  E getError() => isSuccess ? null : error;

  /// Returns the [value][Result.value] if this [Result] is a success, otherwise [defaultValue].
  T getOr(T Function() defaultValue) => isSuccess ? value : defaultValue();

  /// Returns the [error][Result.error] if this [Result] is a failure, otherwise [defaultError].
  E getErrorOr(E Function() defaultError) => isFailure ? error : defaultError();

  /// Returns the [value][Result.value] if this [Result] is a success, otherwise the
  /// [transformation][transform] of the [error][Result.error].
  T getOrElse(T Function(E) transform) {
    assert(transform != null);

    if (isFailure) {
      return transform(error);
    } else {
      return value;
    }
  }

  /// Returns the [error][Result.error] if this [Result] is a failure, otherwise the
  /// [transformation][transform] of the [value][Result.value].
  E getErrorOrElse(E Function(T) transform) {
    assert(transform != null);

    if (isSuccess) {
      return transform(value);
    } else {
      return error;
    }
  }
}
