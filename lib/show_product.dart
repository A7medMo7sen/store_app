import 'package:flutter/material.dart';

class ShowProducts extends StatelessWidget {
  const ShowProducts({
    super.key,
    required this.title,
    required this.price,
    required this.image,
  });
  final String title;
  final double price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromRGBO(214, 240, 253, 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          Text('\$$price', style: Theme.of(context).textTheme.bodySmall),
          Center(child: Image.asset(image, height: 175)),
        ],
      ),
    );
  }
}
