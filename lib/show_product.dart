import 'package:flutter/material.dart';

class ShowProducts extends StatelessWidget {
  const ShowProducts({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.backgroundColor
  });
  final String title;
  final double price;
  final String image;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor,
        border: BoxBorder.all(
          color: Color.fromRGBO(0, 0, 0, .3),
          width: 1
        )
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
