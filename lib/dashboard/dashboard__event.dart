part of 'dashboard__bloc.dart';

@immutable
abstract class DashboardEvent {}

class DashboardInitialEvent extends DashboardEvent {}

/*
* App Bar Buttons Events
* */
class appbarCartButtonClickE extends DashboardEvent {}

class appbarWishListButtonClickE extends DashboardEvent {}


/*
* Card Buttons Events
* */

class cardWishlistButtonClick extends DashboardEvent {}

class cardAddToCartButtonClick extends DashboardEvent {
  ProductListData cartPrdData;
  cardAddToCartButtonClick(this.cartPrdData);
}

