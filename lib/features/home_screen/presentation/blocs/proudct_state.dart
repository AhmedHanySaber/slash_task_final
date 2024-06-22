

import 'package:equatable/equatable.dart';

import '../../data/models/proudct_model.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final ProductList productList;

  const ProductLoaded(this.productList);

  @override
  List<Object> get props => [productList];
}

class ProductError extends ProductState {
  final String message;

  const ProductError(this.message);

  @override
  List<Object> get props => [message];
}
