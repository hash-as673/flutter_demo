import 'package:flutter/material.dart';

class OnboardingViewModel extends ChangeNotifier {
  bool _isGetStartedInitiated = false;
  bool get isGetStartedInitiated => _isGetStartedInitiated;

  void onGetStartedClicked() {
    _isGetStartedInitiated = true;
    // In a real app, you'd perform logic here (e.g., save to preferences)
    // For now, just notify listeners if any, or directly trigger navigation.
    notifyListeners();
    debugPrint("OnboardingViewModel: Get Started button clicked!");
  }
}