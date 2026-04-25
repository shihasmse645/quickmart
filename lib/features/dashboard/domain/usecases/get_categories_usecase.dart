import 'package:quikmart/features/dashboard/domain/entites/category_entity.dart';

import '../repositories/dashboard_repository.dart';

class GetCategoriesUseCase {
  final DashboardRepository repository;

  GetCategoriesUseCase(this.repository);

  Future<List<CategoryEntity>> call() {
    return repository.getCategories();
  }
}
