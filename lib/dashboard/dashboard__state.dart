part of 'dashboard__bloc.dart';

@immutable
abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashboardLoadingState extends DashboardState {}

class DashboardSuccessState extends DashboardState {
  List<ProductListData> productListData=[];
  DashboardSuccessState(this.productListData);
}

class DashboardErrorState extends DashboardState {}

/*
* Card buttons state
* */
class AddProductToCart extends DashboardState {}
class AddProductToWishList extends DashboardState {}

/*
* App bar buttons state
* */
class appbarCartButtonClickS extends DashboardState {}
class appbarWishListButtonClickS extends DashboardState {}
