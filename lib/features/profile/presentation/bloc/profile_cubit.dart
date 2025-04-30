import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileState {
  final Map<String, String> user; // Mock data
  ProfileState({this.user = const {}});
}

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState());

  void loadProfile() {
    // Mock data
    final mockUser = {
      'name': 'John Doe',
      'email': 'john.doe@college.edu',
      'rating': '4.5',
    };
    emit(ProfileState(user: mockUser));
  }
}