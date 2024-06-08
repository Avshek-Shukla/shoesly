import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  const Failure({required this.message, required this.statusCode});

  final String? message;
  final int statusCode;

  static const notFound = Failure(
    message: 'Not Found',
    statusCode: 404,
  );
  static const unauthorized = Failure(
    message: 'Unauthorized',
    statusCode: 401,
  );
  static const connectionError = Failure(
    message: 'Connection Error',
    statusCode: 500,
  );
  static const cloudinaryError = Failure(
    message: 'Cloudinary Image Upload Failed',
    statusCode: 500,
  );

  @override
  List<Object> get props => [statusCode];
}

class APIFailure extends Failure {
  const APIFailure({required super.message, required super.statusCode});
}

class CacheFailure extends Failure {
  const CacheFailure({required super.message, required super.statusCode});
}

class NetworkFailure extends Failure {
  const NetworkFailure({required super.message, required super.statusCode});
}
