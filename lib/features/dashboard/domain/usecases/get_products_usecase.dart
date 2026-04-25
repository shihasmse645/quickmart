import 'package:quikmart/features/dashboard/domain/entites/product_entity.dart';

import '../repositories/dashboard_repository.dart';

class GetProductsUseCase {
  final DashboardRepository repository;

  GetProductsUseCase(this.repository);

  Future<List<ProductEntity>> call() {
    return repository.getProducts();
  }
}
