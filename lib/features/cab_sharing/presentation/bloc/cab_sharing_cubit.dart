import 'package:flutter_bloc/flutter_bloc.dart';

class CabSharingState {
  final List<Map<String, String>> rides; // Mock data
  CabSharingState({this.rides = const []});
}

class CabSharingCubit extends Cubit<CabSharingState> {
  CabSharingCubit() : super(CabSharingState());

  void loadRides() {
    // Mock data
    final mockRides = [
      {'route': 'Library to Hostel', 'time': '6 PM', 'seats': '2'},
      {'route': 'Campus to City Mall', 'time': '7 PM', 'seats': '3'},
    ];
    emit(CabSharingState(rides: mockRides));
  }

  void createRide(Map<String, String> ride) {
    final newRides = [...state.rides, ride];
    emit(CabSharingState(rides: newRides));
  }
}