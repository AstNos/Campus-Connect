import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../ bloc/study_hub_cubit.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../routes.dart';
import '../widgets/group_card.dart';

class StudyHubHomePage extends StatelessWidget {
  const StudyHubHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.studyHub)),
      body: BlocBuilder<StudyHubCubit, StudyHubState>(
        builder: (context, state) {
          context.read<StudyHubCubit>().loadGroups();
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(AppSizes.paddingMedium),
                child: CustomButton(
                  text: AppStrings.createGroup,
                  onPressed: () => Navigator.pushNamed(context, Routes.createGroup),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: state.groups.length,
                  itemBuilder: (context, index) {
                    final group = state.groups[index];
                    return GroupCard(
                      name: group['name']!,
                      subject: group['subject']!,
                      members: group['members']!,
                      onTap: () => Navigator.pushNamed(context, Routes.groupDashboard),
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
      currentIndex: 0,
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