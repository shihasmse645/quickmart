
import 'package:quikmart/features/dashboard/domain/entites/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel(super.name);

  factory CategoryModel.fromJson(String json) {
    return CategoryModel(json);
  }
}
