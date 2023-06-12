import 'dart:developer';

import 'package:bloc/bloc.dart';

import 'package:vakinha_burger/app/pages/home/home_state.dart';
import 'package:vakinha_burger/app/repositories/products/products_repository.dart';

class HomeController extends Cubit<HomeState> {
  HomeController(
    this._productRepository,
  ) : super(const HomeState.initial());

  final ProductsRepository _productRepository;

  Future<void> loadProducts() async {
    emit(state.copyWith(status: HomeStateStatus.loading));
    try {
      final products = await _productRepository.findAllProducts();

      emit(state.copyWith(status: HomeStateStatus.loaded, products: products));
    } catch (e, s) {
      log('Erro ao buscar produtos', error: e, stackTrace: s);
      emit(
        state.copyWith(
            status: HomeStateStatus.error,
            errorMessage: 'Erro ao buscar produtos'),
      );
    }
  }
}
