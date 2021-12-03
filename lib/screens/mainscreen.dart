import 'dart:convert';
import 'package:catlog_flutter/widget/darawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'cart.dart';
import 'cartm.dart';
import '../colors/colors.dart';
import 'detail.dart';
import 'models.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //List<Welcome> mylist =[];
  //Welcome? wel;
  List<Product>? products; // importnt direct call this from data classs

  @override
  void initState() {
    loaData();
    super.initState();
  }

  Future<String> _loadAStudentAsset() async {
    return await rootBundle.loadString('assets/json/maindata.JSON');
  }

  Future loaData() async {
    String jsonString = await _loadAStudentAsset();
    final jsonResponse = json.decode(jsonString);
    Welcome adata = Welcome.fromJson(jsonResponse);

    setState(() {
      products = adata.products;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Palette.blue,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartScreen()),
            );
          },
          child: const Icon(Icons.shopping_cart_outlined),
        ),
        appBar: AppBar(
          backgroundColor: Palette.blue,
        ),
        backgroundColor: Colors.white,
        drawer: const MyDrawer(),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
            child: SingleChildScrollView(
              child: Wrap(
                children: [
                  Text(
                    "Catalog app",
                    style: GoogleFonts.adamina(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Trending Products",
                    style: GoogleFonts.abel(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  ListView.builder(
                    itemExtent: 150,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                detail: products![index],
                              ),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 12,
                          margin: EdgeInsets.all(8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                      products![index].image ?? "",
                                      width: 100,
                                      height: 100,
                                    ),
                                    Text(
                                      "${products![index].id}",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            products![index].name ?? "",
                                            style: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            products![index].desc ?? "",
                                            maxLines: 2,
                                            style: GoogleFonts.roboto(
                                                fontSize: 15,
                                                color: Colors.black),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "\$${products![index].price} ",
                                                textScaleFactor: 1.5,
                                                style: const TextStyle(
                                                  color: Colors.deepPurple,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              elebt()
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: products!.length,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class FlightCalculationDataItem extends StatelessWidget {
  FlightCalculationDataItem({this.title, this.body});

  final String? title;
  final String? body;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title!,
        ),
        Text(
          body!,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}

class Textsy extends StatelessWidget {
  Textsy({this.title, this.body, this.color, this.size});

  final String? title;
  final String? body;
  final Color? color;
  double? size;

  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      style: GoogleFonts.roboto(color: color, fontSize: size),
    );
  }
}

class elebt extends StatefulWidget {
  late final Product catlog;

  @override
  _elebtState createState() => _elebtState();
}

class _elebtState extends State<elebt> {
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // final _catlog = Welcome();
        // final _cart = CartModel();
        // _cart.catalog = _catlog;
        // _cart.add(widget.catlog);
        setState(() {
          isAdded = !isAdded;
        });
      },
      child: isAdded ? Icon(Icons.done) : Text('Add to Cart'),
      style: ElevatedButton.styleFrom(primary: Palette.blue),
    );
  }
}
