import 'package:dartz/dartz.dart';
import 'package:shoesly/core/errors/failures.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;
