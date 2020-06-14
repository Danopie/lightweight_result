import 'package:result_monad/src/result.dart';

extension ResultOr<T, E> on Result<T, E> {
  Result<T, E> or(Result<T, E> Function() result) {
    if (isSuccess) {
      return this;
    } else {
      return result();
    }
  }

  Result<T, E> orElse(Result<T, E> Function(E) transform) {
    if (isSuccess) {
      return this;
    } else {
      return transform(error);
    }
  }

  Result<T, E> recover(T Function(E) transform) {
    if (isSuccess && transform != null) {
      return Result.ok(transform(error));
    } else {
      return this;
    }
  }
}
