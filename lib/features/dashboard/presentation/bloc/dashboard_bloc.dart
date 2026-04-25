import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quikmart/features/dashboard/domain/entites/category_entity.dart';
import 'package:quikmart/features/dashboard/domain/entites/product_entity.dart';
import '../../domain/usecases/get_categories_usecase.dart';
import '../../domain/usecases/get_products_usecase.dart';
import '../../../../core/error/failures.dart';
import 'dashboard_event.dart';
import 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetCategoriesUseCase getCategoriesUseCase;
  final GetProductsUseCase getProductsUseCase;

  DashboardBloc({
    required this.getCategoriesUseCase,
    required this.getProductsUseCase,
  }) : super(DashboardInitial()) {
    on<FetchDashboardDataEvent>((event, emit) async {
      emit(DashboardLoading());
      try {
        final categoriesFuture = getCategoriesUseCase();
        final productsFuture = getProductsUseCase();

        final results = await Future.wait([categoriesFuture, productsFuture]);

        emit(DashboardLoaded(
          categories: results[0] as List<CategoryEntity>,
          products: results[1] as List<ProductEntity>,
        ));
      } catch (e) {
        if (e is Failure) {
          emit(DashboardError(e.message));
        } else {
          emit(DashboardError(e.toString()));
        }
      }
    });
  }
}
