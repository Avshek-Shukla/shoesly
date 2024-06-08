import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shoesly/core/network/network_info.dart';
import 'package:shoesly/features/ProductListing/data/datasources/remote_data_source.dart';
import 'package:shoesly/features/ProductListing/data/repository/product_repository_implementation.dart';
import 'package:shoesly/features/ProductListing/domain/repository/get_products_repository.dart';
import 'package:shoesly/features/ProductListing/domain/usecases/get_products.dart';
import 'package:shoesly/features/ProductListing/presentation/bloc/products_list_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //!Feture ProductListing
  //Bloc

  sl.registerFactory(
    () => ProductsListBloc(
      getProducts: sl(),
    ),
  );

  //Usecase
  sl.registerLazySingleton(
    () => GetProducts(
      sl(),
    ),
  );

  //Repository
  sl.registerLazySingleton<GetProductsRepository>(
    () => GetProductsRepositoryImplementation(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  //Data Source
  sl.registerLazySingleton<ProductsRemoteDataSource>(
    () => const ProductsRemoteDataSourceImplementation(),
  );

  //!Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImplementation(
      sl(),
    ),
  );

  //!External
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
