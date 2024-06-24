
import 'dart:async';

import 'package:advanced_bloc_demo/cart/cart_screen_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../products.dart';
import 'dashboard_data_model.dart';

part 'dashboard__event.dart';
part 'dashboard__state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
  on<DashboardInitialEvent>(dashboardInitial);
  /*
  * Card buttons events
  * */
  on<cardAddToCartButtonClick>(addProductToCart);
  on<cardWishlistButtonClick>(addProductToWishList);

  /*
  * App Bar Buttons Events
  * */


  on<appbarCartButtonClickE>(naviagateToCartScreen);
  on<appbarWishListButtonClickE>(navigateToWishListScreen) ;

  }
  /*
  * this method is called at first time || initial stage
  * */
  FutureOr<void> dashboardInitial(DashboardInitialEvent event, Emitter<DashboardState> emit) async {
    emit(DashboardLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    emit(DashboardSuccessState(Products.prodData));
  }
  /*
  * When user click on specific card cart button then this method called
  * */
  FutureOr<void> addProductToCart(cardAddToCartButtonClick event, Emitter<DashboardState> emit) {
    if(!Products.cartList.contains(event.cartPrdData)){
      Products.cartList.add(event.cartPrdData);
    }else{
      Products.cartList.remove(event.cartPrdData);
    }
    emit(AddProductToCart());
   emit(DashboardSuccessState(Products.prodData));
  }
  /*
  *  When user click on specific card like button then this method called
  * */
  FutureOr<void> addProductToWishList(cardWishlistButtonClick event, Emitter<DashboardState> emit) {
    Products.wishList.add(event.wishPrdData);
    emit(AddProductToWishList());
  }

  /*
  * Appbar Cart Button Clicked
  * */
  FutureOr<void> naviagateToCartScreen(appbarCartButtonClickE event, Emitter<DashboardState> emit) {
    emit(appbarCartButtonClickS());
  }

  /*
  * Appbar WishList Button Clicked
  * */
  FutureOr<void> navigateToWishListScreen(appbarWishListButtonClickE event, Emitter<DashboardState> emit) {
    emit(appbarWishListButtonClickS());
  }

}
