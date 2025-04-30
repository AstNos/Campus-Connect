import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app.dart';
import 'features/ study_hub/presentation/ bloc/study_hub_cubit.dart';
import 'features/marketplace/presentation/ bloc/marketplace_cubit.dart';
import 'features/cab_sharing/presentation/bloc/cab_sharing_cubit.dart';
import 'features/profile/presentation/bloc/profile_cubit.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => StudyHubCubit()),
        BlocProvider(create: (context) => MarketplaceCubit()),
        BlocProvider(create: (context) => CabSharingCubit()),
        BlocProvider(create: (context) => ProfileCubit()),
      ],
      child: const CampusConnectApp(),
    ),
  );
}