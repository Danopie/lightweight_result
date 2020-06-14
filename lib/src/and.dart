import 'package:result_monad/src/result.dart';

extension ResultAnd<T, E> on Result<T, E> {
  Result<T, E> and(Result<T, E> Function() result) {
    if (isSuccess)
      return result();
    else
      return this;
  }

  Result<U, E> andThen<U>(Result<U, E> Function(T) transform) {
    if (isSuccess)
      return transform(value);
    else
      return Result.failure(error);
  }
}
