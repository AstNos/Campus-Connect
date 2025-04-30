import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../ bloc/marketplace_cubit.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';


class PostListingPage extends StatelessWidget {
  const PostListingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final categoryController = TextEditingController();
    final priceController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.postListing)),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.paddingMedium),
        child: Column(
          children: [
            CustomTextField(label: 'Item Title', controller: titleController),
            CustomTextField(label: 'Category', controller: categoryController),
            CustomTextField(label: 'Price', controller: priceController),
            const SizedBox(height: AppSizes.paddingLarge),
            CustomButton(
              text: 'Post',
              onPressed: () {
                context.read<MarketplaceCubit>().postListing({
                  'title': titleController.text,
                  'category': categoryController.text,
                  'price': priceController.text,
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