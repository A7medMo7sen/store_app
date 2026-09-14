import 'package:flutter/material.dart';

class ShowProductsDetails extends StatefulWidget {
  const ShowProductsDetails({super.key, required this.product});
  final Map<String, Object> product;

  @override
  State<ShowProductsDetails> createState() => _ShowProductsDetailsState();
}

class _ShowProductsDetailsState extends State<ShowProductsDetails> {
  int? selectedSize;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(centerTitle: true, title: Text('details')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.product['title'] as String,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Spacer(flex: 1),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(widget.product['imageUrl'] as String),
            ),
            Spacer(flex: 2),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(245, 247, 249, 1),
                borderRadius: BorderRadius.circular(40),
              ),
              height: 200,
              width: double.infinity,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      '\$${widget.product['price'] as double}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: SizedBox(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            (widget.product['sizes'] as List<int>).length,
                        itemBuilder: (context, index) {
                          final size =
                              (widget.product['sizes'] as List<int>)[index];

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedSize = size;
                                });
                              },
                              child: Chip(
                                backgroundColor: selectedSize == size
                                    ? const Color.fromRGBO(154, 221, 255, 1.0)
                                    : const Color.fromRGBO(245, 247, 249, 1),
                                label: Text(
                                  size.toString(),
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(
                          154,
                          221,
                          255,
                          1.0,
                        ),
                        iconColor: Colors.black,
                        minimumSize: Size(double.infinity, 50),
                      ),
                      icon: Icon(Icons.shopping_cart),
                      label: Text(
                        'Add to cart',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
