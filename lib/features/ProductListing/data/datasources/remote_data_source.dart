import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoesly/core/errors/exception.dart';
import 'package:shoesly/features/ProductListing/data/model/product_model.dart';

abstract class ProductsRemoteDataSource {
  Future<List<ProductModel>> getProducts();
}

class ProductsRemoteDataSourceImplementation
    implements ProductsRemoteDataSource {
  const ProductsRemoteDataSourceImplementation();
  @override
  Future<List<ProductModel>> getProducts() async {
    CollectionReference products =
        FirebaseFirestore.instance.collection('shoes');
    QuerySnapshot snapshot = await products.get();
    try {
      List<ProductModel> data = [];
      for (QueryDocumentSnapshot doc in snapshot.docs) {
        Map<String, dynamic> jsonData = doc.data() as Map<String, dynamic>;
        data.add(ProductModel.fromJson(jsonEncode(jsonData)));
      }
      return data;
    } catch (exception) {
      throw const APIException(
        message: 'Failed',
        statusCode: 404,
      );
    }
  }
}
