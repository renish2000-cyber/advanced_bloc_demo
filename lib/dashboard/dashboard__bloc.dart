
import 'dart:async';

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
    List<ProductListData> prodData=Products.productList.map((e) => ProductListData(e["productId"], e["productName"], e["category"], e["price"], e["unit"], e["image"])).toList();
    emit(DashboardSuccessState(prodData));
  }
  /*
  * When user click on specific card cart button then this method called
  * */
  FutureOr<void> addProductToCart(cardAddToCartButtonClick event, Emitter<DashboardState> emit) {
    Products.cartList.add(event.cartPrdData);
    emit(AddProductToCart());
  }
  /*
  *  When user click on specific card like button then this method called
  * */
  FutureOr<void> addProductToWishList(cardWishlistButtonClick event, Emitter<DashboardState> emit) {

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
