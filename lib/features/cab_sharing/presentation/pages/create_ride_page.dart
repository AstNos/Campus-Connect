import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../bloc/cab_sharing_cubit.dart';

class CreateRidePage extends StatelessWidget {
  const CreateRidePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeController = TextEditingController();
    final timeController = TextEditingController();
    final seatsController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.offerRide)),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.paddingMedium),
        child: Column(
          children: [
            CustomTextField(label: 'Route (e.g., Library to Hostel)', controller: routeController),
            CustomTextField(label: 'Departure Time', controller: timeController),
            CustomTextField(label: 'Available Seats', controller: seatsController),
            const SizedBox(height: AppSizes.paddingLarge),
            CustomButton(
              text: 'Offer Ride',
              onPressed: () {
                context.read<CabSharingCubit>().createRide({
                  'route': routeController.text,
                  'time': timeController.text,
                  'seats': seatsController.text,
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}