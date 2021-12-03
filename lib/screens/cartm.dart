import 'package:catlog_flutter/screens/models.dart';

class CartModel {
  // catalog field
  late Welcome _catalog;

  // Collection of IDs - store Ids of each item
  final List<int> _itemIds = [];

  // Get Catalog
  Welcome get catalog => _catalog;

  set catalog(Welcome newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // Get items in the cart
  List<Product>? get products =>
      _itemIds.map((id) => _catalog.getbyId(id)).toList();

  // Get total price
  num get totalPrice =>
      products!.fold(0, (total, current) => total + current.price);

  // Add Item

  void add(Product item) {
    _itemIds.add(item.id);
  }

  // Remove Item

  void remove(Product item) {
    _itemIds.remove(item.id);
  }
}
