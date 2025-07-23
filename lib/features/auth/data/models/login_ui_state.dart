class LoginUiState {
  final String email;
  final String password;
  final bool isLoading;
  final String? errorMessage;
  final bool isLoginSuccess;

  LoginUiState({
    this.email = '',
    this.password = '',
    this.isLoading = false,
    this.errorMessage,
    this.isLoginSuccess = false,
  });

  LoginUiState copyWith({
    String? email,
    String? password,
    bool? isLoading,
    String? errorMessage,
    bool? isLoginSuccess,
  }) {
    return LoginUiState(
      email: email ?? this.email,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage, // Nullable, so pass null explicitly to clear
      isLoginSuccess: isLoginSuccess ?? this.isLoginSuccess,
    );
  }
}