import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../routes.dart';
import '../bloc/profile_cubit.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.profile)),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          context.read<ProfileCubit>().loadProfile();
          return Padding(
            padding: const EdgeInsets.all(AppSizes.paddingMedium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: ${state.user['name'] ?? 'N/A'}', style: const TextStyle(fontSize: 18)),
                Text('Email: ${state.user['email'] ?? 'N/A'}'),
                Text('Rating: ${state.user['rating'] ?? 'N/A'}'),
                const SizedBox(height: AppSizes.paddingLarge),
                CustomButton(
                  text: 'Edit Profile',
                  onPressed: () {
                    // Mock edit action
                  },
                ),
                const SizedBox(height: AppSizes.paddingMedium),
                CustomButton(
                  text: 'Logout',
                  color: Colors.red,
                  onPressed: () {
                    // Mock logout action
                  },
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 3,
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