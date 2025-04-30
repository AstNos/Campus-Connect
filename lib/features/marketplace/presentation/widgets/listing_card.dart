import 'package:flutter/material.dart';
import '../../../../core/constants/app_sizes.dart';


class ListingCard extends StatelessWidget {
  final String title;
  final String category;
  final String price;
  final VoidCallback onTap;

  const ListingCard({
    Key? key,
    required this.title,
    required this.category,
    required this.price,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: AppSizes.paddingMedium, vertical: AppSizes.paddingSmall),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.cardRadius)),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('Category: $category\nPrice: $price'),
        onTap: onTap,
      ),
    );
  }
}