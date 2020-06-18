import 'package:lightweight_result/src/result.dart';

extension ResultMap<T, E> on Result<T, E> {
  Result<U, E> map<U>(U Function(T) transform) {
    if (isSuccess)
      return Result.ok(transform(value));
    else
      return Result.err(error);
  }

  Result<T, U> mapError<U>(U Function(E) transform) {
    if (isSuccess)
      return Result.ok(value);
    else
      return Result.err(transform(error));
  }

  Result<U, E> mapOr<U>(U Function(T) transform, U defaultValue) {
    if (isSuccess)
      return Result.ok(transform(value));
    else
      return Result.ok(defaultValue);
  }

  Result<U, E> mapOrElse<U>(
      U Function(T) transform, U Function(E) defaultValue) {
    if (isSuccess)
      return Result.ok(transform(value));
    else
      return Result.ok(defaultValue(error));
  }

  U fold<U>(U Function(T) success, U Function(E) failure) {
    if (isSuccess)
      return success(value);
    else
      return failure(error);
  }

  Result<T, E> toErrorIf(bool Function(T) predicate, E transform(T)) {
    if (isSuccess && predicate(value)) {
      return Result.err(transform(value));
    } else {
      return this;
    }
  }

  Result<T, E> toErrorUnless(bool Function(T) predicate, E transform(T)) {
    if (isSuccess && !predicate(value)) {
      return Result.err(transform(value));
    } else {
      return this;
    }
  }
}
