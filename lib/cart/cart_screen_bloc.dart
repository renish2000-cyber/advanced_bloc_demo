import 'dart:async';

import 'package:advanced_bloc_demo/products.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../dashboard/dashboard_data_model.dart';

part 'cart_screen_event.dart';
part 'cart_screen_state.dart';

class CartScreenBloc extends Bloc<CartScreenEvent, CartScreenState> {
  CartScreenBloc() : super(CartScreenInitial()) {
    on<CartScreenInitialEvent>((event, emit)async {
      emit(CartScreenLoadingState());
      await Future.delayed(Duration(seconds: 2));
      emit(CartScreenSuccessState(Products.cartList));
    });

    on<CartScreenRemoveProductEvent>((event, emit) async{
      emit(CartScreenLoadingState());
      await Future.delayed(Duration(seconds: 2));
      Products.cartList.remove(event.cartPrdData);
      /*
      * cart delete state display toast message
      * success state display updated list
      * */
      emit(cartProductDelete());
      emit(CartScreenSuccessState(Products.cartList));
    });
  }
}
