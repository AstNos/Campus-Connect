import 'package:flutter/material.dart';
import '../../../../core/constants/app_sizes.dart';


class RideCard extends StatelessWidget {
  final String route;
  final String time;
  final String seats;
  final VoidCallback onTap;

  const RideCard({
    Key? key,
    required this.route,
    required this.time,
    required this.seats,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: AppSizes.paddingMedium, vertical: AppSizes.paddingSmall),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.cardRadius)),
      child: ListTile(
        title: Text(route, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('Time: $time\nSeats: $seats'),
        onTap: onTap,
      ),
    );
  }
}