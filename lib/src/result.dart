class Result<T, E> {
  final T value;
  final E error;

  Result.ok(
    this.value,
  ) : error = null;

  Result.err(
    this.error,
  ) : value = null;

  bool get isSuccess => value != null;

  bool get isFailure => !isSuccess;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Result &&
          runtimeType == other.runtimeType &&
          value == other.value &&
          error == other.error;

  @override
  int get hashCode => value.hashCode ^ error.hashCode;

  @override
  String toString() {
    return 'Result{data: $value, error: $error}';
  }
}
