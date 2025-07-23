import 'package:flutter/material.dart';
import 'package:supersud/features/auth/data/models/signup_ui_state.dart';

class SignupViewModel extends ChangeNotifier {
  SignupUiState _uiState = SignupUiState();
  SignupUiState get uiState => _uiState;

  void updateEmail(String email) {
    _uiState = _uiState.copyWith(email: email, errorMessage: null);
    notifyListeners();
  }

  void updatePhoneNumber(String phoneNumber) {
    _uiState = _uiState.copyWith(phoneNumber: phoneNumber, errorMessage: null);
    notifyListeners();
  }

  void updatePassword(String password) {
    _uiState = _uiState.copyWith(password: password, errorMessage: null);
    notifyListeners();
  }

  void updateConfirmPassword(String confirmPassword) {
    _uiState = _uiState.copyWith(confirmPassword: confirmPassword, errorMessage: null);
    notifyListeners();
  }

  Future<void> signup() async {
    _uiState = _uiState.copyWith(isLoading: true, errorMessage: null);
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    if (_uiState.password != _uiState.confirmPassword) {
      _uiState = _uiState.copyWith(
        isLoading: false,
        errorMessage: "Passwords do not match.",
      );
    } else if (_uiState.password.length < 6) {
      _uiState = _uiState.copyWith(
        isLoading: false,
        errorMessage: "Password must be at least 6 characters long.",
      );
    } else if (_uiState.email.isEmpty || !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(_uiState.email)) {
      _uiState = _uiState.copyWith(
        isLoading: false,
        errorMessage: "Please enter a valid email address.",
      );
    } else if (_uiState.phoneNumber.isEmpty || _uiState.phoneNumber.length < 10) {
      _uiState = _uiState.copyWith(
        isLoading: false,
        errorMessage: "Please enter a valid phone number.",
      );
    } else {
      _uiState = _uiState.copyWith(isLoading: false, isSignupSuccess: true);
    }
    notifyListeners();
  }

  void resetSignupSuccess() {
    _uiState = _uiState.copyWith(isSignupSuccess: false);
    notifyListeners();
  }
}
