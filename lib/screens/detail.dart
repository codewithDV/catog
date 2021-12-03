import 'package:catlog_flutter/screens/models.dart';
import 'package:flutter/material.dart';
import 'mainscreen.dart';

class DetailScreen extends StatefulWidget {
  final Product? detail;

  const DetailScreen({Key? key, required this.detail}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 20,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {},
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Image.network(
                widget.detail!.image ?? "",
                width: 400,
                height: 400,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.detail!.name ?? "",
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.detail!.desc ?? "",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 150,
        decoration: const BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(30))),
        padding: const EdgeInsets.all(30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$${widget.detail!.price.toString()} ",
              style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            elebt(),
            ElevatedButton(
                onPressed: () {
                  widget.detail!.id.toString();

                },
                child: const Text("add cart"))
          ],
        ),
      ),
    );
  }
}
