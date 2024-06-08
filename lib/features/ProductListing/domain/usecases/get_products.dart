import 'package:shoesly/core/usecase/usecase.dart';
import 'package:shoesly/core/utils/typedef.dart';
import 'package:shoesly/features/ProductListing/domain/entities/product.dart';
import 'package:shoesly/features/ProductListing/domain/repository/get_products_repository.dart';

class GetProducts extends UsecaseWithoutParams<List<Product>> {
  GetProducts(this._repository);

  final GetProductsRepository _repository;

  @override
  ResultFuture<List<Product>> call() async => _repository.getProducts();
}
