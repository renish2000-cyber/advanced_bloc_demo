part of 'cart_screen_bloc.dart';

@immutable
abstract class CartScreenEvent {}

class CartScreenInitialEvent extends CartScreenEvent {}

class CartScreenRemoveProductEvent extends CartScreenEvent {
  ProductListData cartPrdData;
  CartScreenRemoveProductEvent(this.cartPrdData);
}