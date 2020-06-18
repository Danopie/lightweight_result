import 'package:lightweight_result/src/and.dart';
import 'package:lightweight_result/src/map.dart';
import 'package:lightweight_result/src/result.dart';

/// Apply a [transformation][transform] to two [Results][Result], if both [Results][Result] are [Ok].
/// If not, the first argument which is an [Err] will propagate through.
Result<T, E> zip2<T1, T2, T, E>(
  Result<T1, E> Function() result1,
  Result<T2, E> Function() result2,
  T Function(T1, T2) transform,
) {
  return result1().andThen((v1) => result2().map((v2) => transform(v1, v2)));
}

/// Apply a [transformation][transform] to three [Results][Result], if all [Results][Result] are [Ok].
/// If not, the first argument which is an [Err] will propagate through.
Result<T, E> zip3<T1, T2, T3, T, E>(
  Result<T1, E> Function() result1,
  Result<T2, E> Function() result2,
  Result<T3, E> Function() result3,
  T Function(T1, T2, T3) transform,
) {
  return result1().andThen((v1) =>
      result2().andThen((v2) => result3().map((v3) => transform(v1, v2, v3))));
}

/// Apply a [transformation][transform] to four [Results][Result], if all [Results][Result] are [Ok].
/// If not, the first argument which is an [Err] will propagate through.
Result<T, E> zip4<T1, T2, T3, T4, T, E>(
  Result<T1, E> Function() result1,
  Result<T2, E> Function() result2,
  Result<T3, E> Function() result3,
  Result<T4, E> Function() result4,
  T Function(T1, T2, T3, T4) transform,
) {
  return result1().andThen((v1) => result2().andThen((v2) => result3()
      .andThen((v3) => result4().map((v4) => transform(v1, v2, v3, v4)))));
}

/// Apply a [transformation][transform] to five [Results][Result], if all [Results][Result] are [Ok].
/// If not, the first argument which is an [Err] will propagate through.
Result<T, E> zip5<T1, T2, T3, T4, T5, T, E>(
  Result<T1, E> Function() result1,
  Result<T2, E> Function() result2,
  Result<T3, E> Function() result3,
  Result<T4, E> Function() result4,
  Result<T5, E> Function() result5,
  T Function(T1, T2, T3, T4, T5) transform,
) {
  return result1().andThen((v1) => result2().andThen((v2) => result3().andThen(
      (v3) => result4().andThen(
          (v4) => result5().map((v5) => transform(v1, v2, v3, v4, v5))))));
}
