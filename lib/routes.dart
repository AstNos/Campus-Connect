import 'package:flutter/material.dart';
import 'features/ study_hub/presentation/pages/create_group_page.dart';
import 'features/ study_hub/presentation/pages/group_dashboard_page.dart';
import 'features/ study_hub/presentation/pages/study_hub_home_page.dart';
import 'features/marketplace/presentation/pages/marketplace_home_page.dart';
import 'features/marketplace/presentation/pages/post_listing_page.dart';
import 'features/marketplace/presentation/pages/listing_details_page.dart';
import 'features/cab_sharing/presentation/pages/cab_sharing_home_page.dart';
import 'features/cab_sharing/presentation/pages/create_ride_page.dart';
import 'features/cab_sharing/presentation/pages/ride_details_page.dart';
import 'features/profile/presentation/pages/profile_page.dart';

class Routes {
  static const home = '/';
  static const createGroup = '/create_group';
  static const groupDashboard = '/group_dashboard';
  static const marketplace = '/marketplace';
  static const postListing = '/post_listing';
  static const listingDetails = '/listing_details';
  static const cabSharing = '/cab_sharing';
  static const createRide = '/create_ride';
  static const rideDetails = '/ride_details';
  static const profile = '/profile';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const StudyHubHomePage());
      case createGroup:
        return MaterialPageRoute(builder: (_) => const CreateGroupPage());
      case groupDashboard:
        return MaterialPageRoute(builder: (_) => const GroupDashboardPage());
      case marketplace:
        return MaterialPageRoute(builder: (_) => const MarketplaceHomePage());
      case postListing:
        return MaterialPageRoute(builder: (_) => const PostListingPage());
      case listingDetails:
        return MaterialPageRoute(builder: (_) => const ListingDetailsPage());
      case cabSharing:
        return MaterialPageRoute(builder: (_) => const CabSharingHomePage());
      case createRide:
        return MaterialPageRoute(builder: (_) => const CreateRidePage());
      case rideDetails:
        return MaterialPageRoute(builder: (_) => const RideDetailsPage());
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(body: Center(child: Text('Route Not Found'))),
        );
    }
  }
}