import 'package:lightweight_result/src/result.dart';

extension ResultMap<T, E> on Result<T, E> {
  /// Maps this [Result<T, E>][Result] to [Result<U, E>][Result] by either applying the [transform]
  /// function to the [value][Ok.value] if this [Result] is [Ok], or returning this [Err].
  Result<U, E> map<U>(U Function(T) transform) {
    if (isSuccess)
      return Result.ok(transform(value));
    else
      return Result.err(error);
  }

  /// Maps this [Result<T, E>][Result] to [Result<T, F>][Result] by either applying the [transform]
  /// function to the [error][Err.error] if this [Result] is [Err], or returning this [Ok].
  Result<T, F> mapError<F>(F Function(E) transform) {
    if (isSuccess)
      return Result.ok(value);
    else
      return Result.err(transform(error));
  }

  /// Maps this [Result<T, E][Result] to [U] by either applying the [transform] function to the
  /// [value][Ok.value] if this [Result] is [Ok], or returning the [defaultValue] if this [Result] is an
  /// [Err].
  Result<U, E> mapOr<U>(U Function(T) transform, U defaultValue) {
    if (isSuccess)
      return Result.ok(transform(value));
    else
      return Result.ok(defaultValue);
  }

  /// Maps this [Result<T, E>][Result] to [U] by applying either the [transform] function if this
  /// [Result] is [Ok], or the [defaultValue] function if this [Result] is an [Err]. Both of these
  /// functions must return the same type ([U]).
  Result<U, E> mapOrElse<U>(
      U Function(T) transform, U Function(E) defaultValue) {
    if (isSuccess)
      return Result.ok(transform(value));
    else
      return Result.ok(defaultValue(error));
  }

  /// Maps this [Result<T, E>][Result] to [U] by applying either the [success] function if this
  /// [Result] is [Ok], or the [failure] function if this [Result] is an [Err]. Both of these
  /// functions must return the same type ([U]).
  U fold<U>(U Function(T) success, U Function(E) failure) {
    if (isSuccess)
      return success(value);
    else
      return failure(error);
  }

  /// Maps this [Result<T, E>][Result] to [Result<U, F>][Result] by applying either the [success]
  /// function if this [Result] is [Ok], or the [failure] function if this [Result] is an [Err].
  Result<U, F> mapEither<U, F>(U Function(T) success, F Function(E) failure) {
    if (isSuccess)
      return Result.ok(success(value));
    else
      return Result.err(failure(error));
  }

  /// Returns the [transformation][transform] of the [value][Ok.value] if this [Result] is [Ok]
  /// and satisfies the given [predicate], otherwise this [Result].
  Result<T, E> toErrorIf(bool Function(T) predicate, E transform(T)) {
    if (isSuccess && predicate(value)) {
      return Result.err(transform(value));
    } else {
      return this;
    }
  }

  /// Returns the [transformation][transform] of the [value][Ok.value] if this [Result] is [Ok]
  /// and _does not_ satisfy the given [predicate], otherwise this [Result].
  Result<T, E> toErrorUnless(bool Function(T) predicate, E transform(T)) {
    if (isSuccess && !predicate(value)) {
      return Result.err(transform(value));
    } else {
      return this;
    }
  }
}
