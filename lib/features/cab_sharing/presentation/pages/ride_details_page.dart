import 'package:flutter/material.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/widgets/custom_button.dart';


class RideDetailsPage extends StatelessWidget {
  const RideDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ride Details')),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Library to Hostel', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: AppSizes.paddingSmall),
            const Text('Time: 6 PM'),
            const Text('Seats: 2'),
            const Text('Fare: \$5/seat'),
            const SizedBox(height: AppSizes.paddingMedium),
            CustomButton(
              text: 'Book Ride',
              onPressed: () {
                // Mock booking action
              },
            ),
          ],
        ),
      ),
    );
  }
}