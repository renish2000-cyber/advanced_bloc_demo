import 'package:advanced_bloc_demo/dashboard/dashboard_data_model.dart';

class Products {
  static List<Map<String, dynamic>> productList = [
    {
      "productId": "1",
      "productName": "Milk",
      "category": "Dairy",
      "price": 2.50,
      "unit": "1 gallon",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvaIR9xzc1_vPttXpVymfrf1rtm7A9JyciX96UELgVew&s"
    },
    {
      "productId": "2",
      "productName": "Bread",
      "category": "Bakery",
      "price": 1.99,
      "unit": "1 loaf",
      "image":
          "https://images.unsplash.com/photo-1598373182133-52452f7691ef?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGJyZWFkfGVufDB8fDB8fHww"
    },
    {
      "productId": "3",
      "productName": "Eggs",
      "category": "Dairy",
      "price": 1.75,
      "unit": "1 dozen",
      "image":
          "https://images.unsplash.com/photo-1617611647086-bccca8c2cf84?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGVnZ3xlbnwwfHwwfHx8MA%3D%3D"
    },
    {
      "productId": "4",
      "productName": "Apples",
      "category": "Produce",
      "price": 3.99,
      "unit": "1 pound",
      "image":
          "https://images.unsplash.com/photo-1610397962076-02407a169a5b?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D"
    },
  ];

  static List<ProductListData> prodData=productList.map((e) => ProductListData(e["productId"], e["productName"], e["category"], e["price"], e["unit"], e["image"])).toList();

  static List<ProductListData> cartList = [];
  static List<ProductListData> wishList = [];
}
