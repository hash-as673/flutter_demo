class SignupUiState {
  final String email;
  final String phoneNumber;
  final String password;
  final String confirmPassword;
  final bool isLoading;
  final String? errorMessage;
  final bool isSignupSuccess;

  SignupUiState({
    this.email = '',
    this.phoneNumber = '',
    this.password = '',
    this.confirmPassword = '',
    this.isLoading = false,
    this.errorMessage,
    this.isSignupSuccess = false,
  });

  SignupUiState copyWith({
    String? email,
    String? phoneNumber,
    String? password,
    String? confirmPassword,
    bool? isLoading,
    String? errorMessage,
    bool? isSignupSuccess,
  }) {
    return SignupUiState(
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage, // Nullable, so pass null explicitly to clear
      isSignupSuccess: isSignupSuccess ?? this.isSignupSuccess,
    );
  }
}