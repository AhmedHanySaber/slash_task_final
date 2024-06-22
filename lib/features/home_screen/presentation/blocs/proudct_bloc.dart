import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:json_project/features/home_screen/presentation/blocs/proudct_event.dart';
import 'package:json_project/features/home_screen/presentation/blocs/proudct_state.dart';


import '../../domain/usecases/get_proudct.dart';




class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductList getProductList;

  ProductBloc(this.getProductList) : super(ProductInitial()) {
    on<LoadProductListEvent>(_onLoadProductList);
  }

  void _onLoadProductList(LoadProductListEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      final productList = await getProductList();
      emit(ProductLoaded(productList));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
