import 'package:flutter/material.dart';

import '../../data/models/login_ui_state.dart';

class LoginViewModel extends ChangeNotifier {
  LoginUiState _uiState = LoginUiState();
  LoginUiState get uiState => _uiState;

  void updateEmail(String email) {
    _uiState = _uiState.copyWith(email: email, errorMessage: null);
    notifyListeners();
  }

  void updatePassword(String password) {
    _uiState = _uiState.copyWith(password: password, errorMessage: null);
    notifyListeners();
  }

  Future<void> login() async {
    _uiState = _uiState.copyWith(isLoading: true, errorMessage: null);
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    if (_uiState.email == "test@example.com" && _uiState.password == "password") {
      _uiState = _uiState.copyWith(isLoading: false, isLoginSuccess: true);
    } else {
      _uiState = _uiState.copyWith(
        isLoading: false,
        errorMessage: "Invalid email or password. Please try again.",
      );
    }
    notifyListeners();
  }

  void resetLoginSuccess() {
    _uiState = _uiState.copyWith(isLoginSuccess: false);
    notifyListeners();
  }
}
