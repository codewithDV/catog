class Welcome {
  Welcome({
    this.products,
  });

  List<Product>? products;

  Product getbyId(int id) =>
      products!.firstWhere((element) => element.id == id, orElse: null);

  Product getByPosition(int pos) => products![pos];

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    required this.id,
    this.name,
    this.desc,
    required this.price,
    this.color,
    this.image,
  });

  int id;
  String? name;
  String? desc;
  num price;
  String? color;
  String? image;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        desc: json["desc"],
        price: json["price"],
        color: json["color"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image,
      };
}
