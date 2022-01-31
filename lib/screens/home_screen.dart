import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:aara_task/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final url =
      "https://zzzmart.com/admin/ecommerce_api/category/cat_read.php?apicall=category_list";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    // final catalogJson =
    //     await rootBundle.loadString("assets/files/catalog.json");

    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body;
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["TopCategoryId"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(
            color: Colors.indigo,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: const Icon(
          Icons.dehaze_rounded,
          color: Colors.indigo,
          size: 30,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag),
            onPressed: () {},
            color: Colors.indigo,
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        iconSize: 40,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.home,
              color: Colors.grey,
            ),
            label: 'Home',
          ),

          ///Booking
          BottomNavigationBarItem(
              icon: Icon(
                Icons.storefront_outlined,
                color: Colors.grey,
              ),
              label: 'Bookings',
              tooltip: "Bookings"),

          ///Favourite
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: Colors.grey,
            ),
            label: 'Favourite',
          ),

          ///Accounts
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_pin,
              color: Colors.grey,
            ),
            label: 'Profile',
          ),
        ],
      ),
      body: SafeArea(
        child: GridView.builder(
            itemCount: CatalogModel.items.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return ElevatedButton(
                child: Text(""),
                onPressed: () {},
              );
            }),
      ),
    );
  }
}
