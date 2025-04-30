import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../ bloc/marketplace_cubit.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../routes.dart';
import '../widgets/listing_card.dart';


class MarketplaceHomePage extends StatelessWidget {
  const MarketplaceHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.marketplace)),
      body: BlocBuilder<MarketplaceCubit, MarketplaceState>(
        builder: (context, state) {
          context.read<MarketplaceCubit>().loadListings();
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(AppSizes.paddingMedium),
                child: CustomButton(
                  text: AppStrings.postListing,
                  onPressed: () => Navigator.pushNamed(context, Routes.postListing),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: state.listings.length,
                  itemBuilder: (context, index) {
                    final listing = state.listings[index];
                    return ListingCard(
                      title: listing['title']!,
                      category: listing['category']!,
                      price: listing['price']!,
                      onTap: () => Navigator.pushNamed(context, Routes.listingDetails),
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
      currentIndex: 1,
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