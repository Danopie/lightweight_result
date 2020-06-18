import 'package:lightweight_result/src/result.dart';


extension ResultOn<T, E> on Result<T, E> {

  /// Invokes an [action] if this [Result] is [Ok].
  Result<T, E> onSuccess(void Function(T) action) {
    if (isSuccess) {
      action(value);
    }

    return this;
  }

  /// Invokes an [action] if this [Result] is [Err].
  Result<T, E> onFailure(void Function(E) action) {
    if (isFailure) {
      action(error);
    }

    return this;
  }
}
