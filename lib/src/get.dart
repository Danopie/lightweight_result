import 'package:result_monad/src/result.dart';

extension ResultGet<T, E> on Result<T, E> {
  T get() => isSuccess ? value : null;

  E getError() => isSuccess ? null : error;

  T getOr(T Function() defaultValue) => isSuccess ? value : defaultValue();

  E getErrorOr(E Function() defaultError) => isFailure ? error : defaultError();

  T getOrElse(T Function(E) transform) {
    if (isFailure && transform != null) {
      return transform(error);
    } else {
      return null;
    }
  }

  E getErrorOrElse(E Function(T) transform) {
    if (isSuccess && transform != null) {
      return transform(value);
    } else {
      return null;
    }
  }
}
