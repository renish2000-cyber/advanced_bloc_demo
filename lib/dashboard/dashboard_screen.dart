import 'package:advanced_bloc_demo/cart/cart_screen.dart';
import 'package:advanced_bloc_demo/dashboard/dashboard__bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'dashboard_data_model.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DashboardBloc dashboardBloc = DashboardBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /*
    * Call Initial Event
    * */
    dashboardBloc.add(DashboardInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        primary: true,
        backgroundColor: Colors.teal,
        title: const Text("Bloc Advanced Demo"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                dashboardBloc.add(appbarWishListButtonClickE());
              },
              icon: Icon(Icons.favorite_border_outlined)),
          IconButton(
              onPressed: () {
                dashboardBloc.add(appbarCartButtonClickE());
              },
              icon: Icon(Icons.shopping_cart_outlined))
        ],
      ),
      body: BlocConsumer<DashboardBloc, DashboardState>(
        bloc: dashboardBloc,
        buildWhen: ((previous, current) => current is DashboardSuccessState || current is DashboardLoadingState),
        listener: (context, state) {
          if (state  is AddProductToCart) {
            Fluttertoast.showToast(msg: "Product Added to Cart Successfully");
          } else if (state is AddProductToWishList) {
            Fluttertoast.showToast(msg: "Product");
          }
          else if(state is appbarCartButtonClickS){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartListScreen(),));
          }
          else if(state is appbarWishListButtonClickS){
          }
        },
        builder: (context, state) {
          if (state is DashboardLoadingState) {
            return Center(child: CircularProgressIndicator(),);

            /*
            * return loading in dialog box
            * */
            /*
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Row(
                      children: const [
                        CircularProgressIndicator(),
                        SizedBox(width: 16.0),
                        Text('Loading...'),
                      ],
                    ),
                  );
                },
              );
            });
*/
          } else if (state is DashboardSuccessState) {
            return productList(state.productListData);
          }
          return const Text("Container Demo");
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
                          dashboardBloc.add(cardWishlistButtonClick());
                        },
                        icon: Icon(Icons.favorite_border_outlined)),
                    IconButton(
                        onPressed: () {
                          dashboardBloc
                              .add(cardAddToCartButtonClick(prdData[index]));
                        },
                        icon: Icon(Icons.shopping_cart_outlined)),
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
