import 'package:e_commerce_app/models/product_model.dart';

// Abstract base class for product events
abstract class ProductEvent {}

// Event for fetching products
class GetProductEvent extends ProductEvent {}

// Event for toggling a product's favorite status
class ToggleFavoriteEvent extends ProductEvent {
  final int productId;

  ToggleFavoriteEvent(this.productId);
}
// Abstract base class for product states
abstract class ProductState {
}

// Initial state before any product actions
class ProductInitial extends ProductState {}

// State when products are being loaded
class ProductLoadingState extends ProductState {}

// State with the list of loaded products
class ProductLoadedState extends ProductState {
  final List<Product> listProduct;

  ProductLoadedState({required this.listProduct});

  ProductLoadedState copyWith({List<Product>? listProduct}) {
    return ProductLoadedState(
      listProduct: listProduct ?? this.listProduct,
    );
  }
}


// State when no products are found
class ProductEmptyState extends ProductState {}

// State with an error message if loading products fails
class ProductErrorLoadingState extends ProductState {
  final String errorMessage;

  ProductErrorLoadingState({required this.errorMessage});
}
