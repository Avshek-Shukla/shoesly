import 'package:dartz/dartz.dart';
import 'package:shoesly/core/errors/exception.dart';
import 'package:shoesly/core/errors/failures.dart';
import 'package:shoesly/core/network/network_info.dart';
import 'package:shoesly/core/utils/typedef.dart';
import 'package:shoesly/features/ProductListing/data/datasources/remote_data_source.dart';
import 'package:shoesly/features/ProductListing/domain/entities/product.dart';
import 'package:shoesly/features/ProductListing/domain/repository/get_products_repository.dart';

class GetProductsRepositoryImplementation implements GetProductsRepository {
  GetProductsRepositoryImplementation({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  final ProductsRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  @override
  ResultFuture<List<Product>> getProducts() async {
    {
      if (await networkInfo.isConnected) {
        try {
          final productLists = await remoteDataSource.getProducts();
          // localDataSource.cacheLoginInformation(remoteLoginInformation);
          return (Right(productLists));
        } on APIException catch (e) {
          return Left(APIFailure(message: e.message, statusCode: e.statusCode));
        }
      } else {
        return const Left(Failure.connectionError);
      }
    }
  }
}
