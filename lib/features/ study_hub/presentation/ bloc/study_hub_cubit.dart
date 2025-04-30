import 'package:flutter_bloc/flutter_bloc.dart';

class StudyHubState {
  final List<Map<String, String>> groups; // Mock data
  StudyHubState({this.groups = const []});
}

class StudyHubCubit extends Cubit<StudyHubState> {
  StudyHubCubit() : super(StudyHubState());

  void loadGroups() {
    // Mock data
    final mockGroups = [
      {'name': 'Linear Algebra Study Buddies', 'subject': 'Math', 'members': '5/10'},
      {'name': 'Marketing Project Group A', 'subject': 'Business', 'members': '3/8'},
    ];
    emit(StudyHubState(groups: mockGroups));
  }

  void createGroup(Map<String, String> group) {
    final newGroups = [...state.groups, group];
    emit(StudyHubState(groups: newGroups));
  }
}