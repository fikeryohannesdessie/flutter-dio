/// Represents a failure (error) in the app.
abstract class Failure {
  final String message;
  const Failure(this.message);
}

/// Failure due to a network/server error.
class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

/// Failure due to no internet connection.
class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

/// Failure due to unexpected errors.
class UnexpectedFailure extends Failure {
  const UnexpectedFailure(super.message);
}
