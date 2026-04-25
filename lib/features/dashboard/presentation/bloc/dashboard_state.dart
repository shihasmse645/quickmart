import 'package:equatable/equatable.dart';
import 'package:quikmart/features/dashboard/domain/entites/category_entity.dart';
import 'package:quikmart/features/dashboard/domain/entites/product_entity.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();
  
  @override
  List<Object> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final List<CategoryEntity> categories;
  final List<ProductEntity> products;

  const DashboardLoaded({required this.categories, required this.products});

  @override
  List<Object> get props => [categories, products];
}

class DashboardError extends DashboardState {
  final String message;

  const DashboardError(this.message);

  @override
  List<Object> get props => [message];
}
