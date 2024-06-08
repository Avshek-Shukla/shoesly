import 'package:shoesly/core/utils/typedef.dart';
import 'package:shoesly/features/ProductListing/domain/entities/product.dart';

abstract class GetProductsRepository {
  ResultFuture<List<Product>> getProducts();
}
