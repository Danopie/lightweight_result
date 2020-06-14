import 'package:result_monad/src/result.dart';

extension ResultOn<T, E> on Result<T, E> {
  Result<T, E> onSuccess(void Function(T) action) {
    if (isSuccess) {
      action(value);
    }

    return this;
  }

  Result<T, E> onFailure(void Function(E) action) {
    if (isFailure) {
      action(error);
    }

    return this;
  }
}
