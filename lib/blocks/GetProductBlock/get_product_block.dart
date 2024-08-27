import 'package:e_commerce_app/Services/products_services.dart';
import 'package:e_commerce_app/blocks/GetProductBlock/get_product_state.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc({required this.productRepository}) : super(ProductInitial()) {
    // Handle GetProductEvent
    on<GetProductEvent>((event, emit) async {
      emit(ProductLoadingState());

      try {
        List<Product> listProduct = await productRepository.getProduct();
        if (listProduct.isEmpty) {
          emit(ProductEmptyState());
        } else {
          emit(ProductLoadedState(listProduct: listProduct));
        }
      } catch (e, stackTrace) {
        // Optionally log the error and stack trace
        print('Error fetching products: $e');
        print('Stack trace: $stackTrace');
        emit(ProductErrorLoadingState(errorMessage: e.toString()));
      }
    });

    // Handle ToggleFavoriteEvent
    on<ToggleFavoriteEvent>((event, emit) {
      if (state is ProductLoadedState) {
        final currentState = state as ProductLoadedState;

        final updatedProducts = currentState.listProduct.map((product) {
          if (product.id == event.productId) {
            return product.copyWith(isFavorite: !product.isFavorite);
          }
          return product;
        }).toList();

        emit(currentState.copyWith(listProduct: updatedProducts));
      }
    });
  }
}
