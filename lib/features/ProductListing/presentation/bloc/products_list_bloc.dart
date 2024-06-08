import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shoesly/features/ProductListing/domain/entities/product.dart';
import 'package:shoesly/features/ProductListing/domain/usecases/get_products.dart';

part 'products_list_event.dart';
part 'products_list_state.dart';

class ProductsListBloc extends Bloc<ProductsListEvent, ProductsListState> {
  ProductsListBloc({required this.getProducts}) : super(ProductsListInitial()) {
    on<GetProductListsEvent>(getProductListHndler);
  }
  final GetProducts getProducts;

  Future<void> getProductListHndler(
    GetProductListsEvent event,
    Emitter<ProductsListState> emit,
  ) async {
    emit(GettingProducts());
    final result = await getProducts();
    result.fold(
      (failure) => emit(
        GetProductListError('${failure.statusCode} ${failure.message}'),
      ),
      (data) => emit(
        GotProducts(data),
      ),
    );
  }
}
