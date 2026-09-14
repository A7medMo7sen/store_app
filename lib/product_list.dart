import 'package:flutter/material.dart';
import 'package:store_app/product_details.dart';
import 'package:store_app/show_product.dart';
import 'global_variables.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const ['All', 'Adidas', 'Puma', 'Nike'];
  late String selectedFilter;
  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override

  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(225, 225, 225, 1.0)),
      borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
    );

    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Shoes \nCollection',
                  style: TextStyle(fontWeight: FontWeight(700), fontSize: 30),
                ),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: border,
                    enabledBorder: border,
                    focusedBorder: border,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index) {
                final filter = filters[index];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    child: Chip(
                      backgroundColor: selectedFilter == filter
                          ? const Color.fromRGBO(154, 221, 255, 1.0)
                          : const Color.fromRGBO(245, 247, 249, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(30),
                      ),
                      side: BorderSide(
                        color: const Color.fromRGBO(198, 198, 198, 1.0),
                      ),
                      label: Text(filter),
                      labelStyle: TextStyle(fontSize: 16),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ShowProductsDetails(product: product);
                        },
                      ),
                    );
                  },
                  child: ShowProducts(
                    backgroundColor: index.isEven
                        ? const Color.fromRGBO(214, 240, 253, 1)
                        : const Color.fromRGBO(245, 247, 249, 1),
                    title: product['title'] as String,
                    price: product['price'] as double,
                    image: product['imageUrl'] as String,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
