import 'package:flutter_bloc/flutter_bloc.dart';

class MarketplaceState {
  final List<Map<String, String>> listings; // Mock data
  MarketplaceState({this.listings = const []});
}

class MarketplaceCubit extends Cubit<MarketplaceState> {
  MarketplaceCubit() : super(MarketplaceState());

  void loadListings() {
    // Mock data
    final mockListings = [
      {'title': 'Calculus Textbook', 'category': 'Books', 'price': '\$20'},
      {'title': 'Laptop Charger', 'category': 'Electronics', 'price': '\$15'},
    ];
    emit(MarketplaceState(listings: mockListings));
  }

  void postListing(Map<String, String> listing) {
    final newListings = [...state.listings, listing];
    emit(MarketplaceState(listings: newListings));
  }
}