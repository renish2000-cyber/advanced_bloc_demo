import 'package:advanced_bloc_demo/cart/cart_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../dashboard/dashboard_data_model.dart';
class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  CartScreenBloc cartScreenBloc=CartScreenBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartScreenBloc.add(CartScreenInitialEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Products"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        primary: true,
      ),
      body: BlocConsumer(
        bloc: cartScreenBloc,
        buildWhen: (previous, current) => (current is cartProductDelete || current is CartScreenLoadingState || current is  CartScreenSuccessState ),
        listener: (context, state) {
          if(state is cartProductDelete){
            Fluttertoast.showToast(msg: "Product Remove from Cart");
          }
        },
        builder: (context, state) {
          if(state is CartScreenLoadingState){
            return Center(child: CircularProgressIndicator(),);
          }
          else if(state is CartScreenSuccessState){
            return productList(state.cartList);
          }
          return Center(child: Container(child: Text("No Data Found"),));
        },
      ),
    );

  }
  Widget productList(List<ProductListData> prdData) {
    return ListView.builder(
      itemCount: prdData.length,
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: EdgeInsets.all(0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 200,
                  width: double.maxFinite,
                  child: Image.network(prdData[index].image, fit: BoxFit.cover),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Text(
                      prdData[index].productName,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, letterSpacing: 1),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "\$${prdData[index].price}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, letterSpacing: 1),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                        //  dashboardBloc.add(cardWishlistButtonClick());
                        },
                        icon: Icon(Icons.favorite_border_outlined)),
                    IconButton(
                        onPressed: () {
                          cartScreenBloc
                              .add(CartScreenRemoveProductEvent(prdData[index]));
                        },
                        icon: Icon(Icons.shopping_cart)),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

}
