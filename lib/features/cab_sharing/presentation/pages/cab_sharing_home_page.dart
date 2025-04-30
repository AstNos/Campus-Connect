import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../routes.dart';
import '../bloc/cab_sharing_cubit.dart';
import '../widgets/ride_card.dart';

class CabSharingHomePage extends StatelessWidget {
  const CabSharingHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.cabSharing)),
      body: BlocBuilder<CabSharingCubit, CabSharingState>(
        builder: (context, state) {
          context.read<CabSharingCubit>().loadRides();
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(AppSizes.paddingMedium),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: AppStrings.offerRide,
                        onPressed: () => Navigator.pushNamed(context, Routes.createRide),
                      ),
                    ),
                    const SizedBox(width: AppSizes.paddingMedium),
                    Expanded(
                      child: CustomButton(
                        text: AppStrings.findRide,
                        onPressed: () {
                          // Mock find ride action
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: state.rides.length,
                  itemBuilder: (context, index) {
                    final ride = state.rides[index];
                    return RideCard(
                      route: ride['route']!,
                      time: ride['time']!,
                      seats: ride['seats']!,
                      onTap: () => Navigator.pushNamed(context, Routes.rideDetails),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 2,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textSecondary,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, Routes.home);
            break;
          case 1:
            Navigator.pushNamed(context, Routes.marketplace);
            break;
          case 2:
            Navigator.pushNamed(context, Routes.cabSharing);
            break;
          case 3:
            Navigator.pushNamed(context, Routes.profile);
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.book), label: AppStrings.studyHub),
        BottomNavigationBarItem(icon: Icon(Icons.store), label: AppStrings.marketplace),
        BottomNavigationBarItem(icon: Icon(Icons.directions_car), label: AppStrings.cabSharing),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: AppStrings.profile),
      ],
    );
  }
}