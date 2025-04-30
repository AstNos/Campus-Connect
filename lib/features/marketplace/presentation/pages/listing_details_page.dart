import 'package:flutter/material.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/widgets/custom_button.dart';


class ListingDetailsPage extends StatelessWidget {
  const ListingDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Listing Details')),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Calculus Textbook', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: AppSizes.paddingSmall),
            const Text('Category: Books'),
            const Text('Price: \$20'),
            const Text('Condition: Like New'),
            const SizedBox(height: AppSizes.paddingMedium),
            CustomButton(
              text: 'Contact Seller',
              onPressed: () {
                // Mock chat action
              },
            ),
            const SizedBox(height: AppSizes.paddingMedium),
            CustomButton(
              text: 'Report Listing',
              color: Colors.red,
              onPressed: () {
                // Mock report action
              },
            ),
          ],
        ),
      ),
    );
  }
}