import 'package:quikmart/features/dashboard/domain/entites/category_entity.dart';
import 'package:quikmart/features/dashboard/domain/entites/product_entity.dart';
import 'package:quikmart/features/dashboard/domain/repositories/dashboard_repository.dart';

import '../../../../core/network/network_client.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final NetworkClient networkClient;

  DashboardRepositoryImpl(this.networkClient);

  @override
  Future<List<CategoryEntity>> getCategories() async {
    final response = await networkClient.get('https://fakestoreapi.com/products/categories');
    final List<dynamic> jsonList = response;
    return jsonList.map((e) => CategoryModel.fromJson(e as String)).toList();
  }

  @override
  Future<List<ProductEntity>> getProducts() async {
    final response = await networkClient.get('https://fakestoreapi.com/products');
    final List<dynamic> jsonList = response;
    return jsonList.map((e) => ProductModel.fromJson(e)).toList();
  }
}
