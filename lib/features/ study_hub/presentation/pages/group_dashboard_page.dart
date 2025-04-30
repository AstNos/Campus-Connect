import 'package:flutter/material.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/widgets/custom_button.dart';


class GroupDashboardPage extends StatelessWidget {
  const GroupDashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Group Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Linear Algebra Study Buddies', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: AppSizes.paddingSmall),
            const Text('Subject: Math'),
            const Text('Members: 5/10'),
            const SizedBox(height: AppSizes.paddingMedium),
            const Text('Upcoming Meeting: Tomorrow, 3 PM'),
            const SizedBox(height: AppSizes.paddingMedium),
            CustomButton(
              text: 'Join Meeting',
              onPressed: () {
                // Mock meeting link action
              },
            ),
            const SizedBox(height: AppSizes.paddingLarge),
            const Text('Group Chat', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const Expanded(child: Center(child: Text('Chat UI Placeholder'))),
          ],
        ),
      ),
    );
  }
}