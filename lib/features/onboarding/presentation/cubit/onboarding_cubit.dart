// features/onboarding/presentation/cubit/onboarding_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final GetStorage _storage;
  static const String _categoriesKey = 'user_selected_categories';
  static const String _onboardingCompleteKey = 'is_onboarding_complete';

  static const List<String> _guardianSections = [
    'Technology',
    'Sport',
    'Business',
    'Politics',
    'World',
    'Environment',
    'Science',
    'Fashion',
  ];

  OnboardingCubit(this._storage)
    : super(
        const OnboardingState(
          availableCategories: _guardianSections,
          selectedCategories: [],
        ),
      );

  void toggleCategory(String category) {
    final updatedList = List<String>.from(state.selectedCategories);
    if (updatedList.contains(category)) {
      updatedList.remove(category);
    } else {
      updatedList.add(category);
    }
    emit(state.copyWith(selectedCategories: updatedList));
  }

  Future<void> savePreferences() async {
    if (state.selectedCategories.isNotEmpty) {
      await _storage.write(_categoriesKey, state.selectedCategories);
      await _storage.write(_onboardingCompleteKey, true);
      emit(state.copyWith(isSaved: true));
    }
  }

  bool isOnboardingComplete() {
    return _storage.read<bool>(_onboardingCompleteKey) ?? false;
  }
}
