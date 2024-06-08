part of 'products_list_bloc.dart';

sealed class ProductsListState extends Equatable {
  const ProductsListState();

  @override
  List<Object> get props => [];
}

final class ProductsListInitial extends ProductsListState {}

class GettingProducts extends ProductsListState {}

class GotProducts extends ProductsListState {
  const GotProducts(this.products);
  final List<Product> products;
}

class GetProductListError extends ProductsListState {
  const GetProductListError(this.message);
  final String message;
}
