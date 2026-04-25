
import 'package:quikmart/features/dashboard/domain/entites/category_entity.dart';
import 'package:quikmart/features/dashboard/domain/entites/product_entity.dart';

abstract class DashboardRepository {
  Future<List<CategoryEntity>> getCategories();
  Future<List<ProductEntity>> getProducts();
}
