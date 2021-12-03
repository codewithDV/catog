import 'package:flutter/material.dart';

import 'cartm.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'Cart',
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
      ),
      body: Column(
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: _cartList(),
            ),
          ),
          Divider(),
          SizedBox(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    (_cart.totalPrice.toString()),
                    style: TextStyle(fontSize: 25),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Buy",
                        style: TextStyle(fontSize: 20),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _cartList extends StatefulWidget {
  const _cartList({Key? key}) : super(key: key);

  @override
  _cartListState createState() => _cartListState();
}

class _cartListState extends State<_cartList> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _cart.products!.length,
        itemBuilder: (context, index) {
          return ListTile(
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.remove_circle_outline),
              ),
              leading: IconButton(
                onPressed: () {},
                icon: Icon(Icons.subdirectory_arrow_right_sharp),
              ),
              title: Text(_cart.products![index].name.toString()));
        });
  }
}
