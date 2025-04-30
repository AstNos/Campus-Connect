import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../ bloc/study_hub_cubit.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';


class CreateGroupPage extends StatelessWidget {
  const CreateGroupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final subjectController = TextEditingController();
    final membersController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.createGroup)),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.paddingMedium),
        child: Column(
          children: [
            CustomTextField(label: 'Group Name', controller: nameController),
            CustomTextField(label: 'Subject', controller: subjectController),
            CustomTextField(label: 'Max Members', controller: membersController),
            const SizedBox(height: AppSizes.paddingLarge),
            CustomButton(
              text: 'Create',
              onPressed: () {
                context.read<StudyHubCubit>().createGroup({
                  'name': nameController.text,
                  'subject': subjectController.text,
                  'members': '${membersController.text}/10',
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