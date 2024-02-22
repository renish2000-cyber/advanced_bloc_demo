part of 'cart_screen_bloc.dart';

@immutable
abstract class CartScreenState {}

class CartScreenInitial extends CartScreenState {}

class CartScreenLoadingState extends CartScreenState {}

class CartScreenSuccessState extends CartScreenState {
  List<ProductListData> cartList;
  CartScreenSuccessState(this.cartList);
}
class cartProductDelete extends CartScreenState {}