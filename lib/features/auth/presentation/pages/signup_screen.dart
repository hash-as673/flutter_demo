import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:supersud/core/theme/app_dimens.dart';
import 'package:supersud/core/widgets/app_elevated_button.dart';
import 'package:supersud/features/auth/presentation/viewmodels/signup_view_model.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignupViewModel(),
      child: Consumer<SignupViewModel>(
        builder: (context, viewModel, _) {
          final uiState = viewModel.uiState;
          final theme = Theme.of(context);
          final colorScheme = theme.colorScheme;
          final textTheme = theme.textTheme;

          if (uiState.isSignupSuccess) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (context.mounted) {
                context.pop(); // Or context.go('/login') if that's preferred
                viewModel.resetSignupSuccess();
              }
            });
          }

          return Scaffold(
            // appBar: AppBar(
            //   backgroundColor: colorScheme.surface,
            //   elevation: 0,
            //   leading: IconButton(
            //     icon: Icon(Icons.arrow_back, color: colorScheme.onSurface),
            //     onPressed: () => context.pop(),
            //   ),
            // ),
            backgroundColor: colorScheme.surface,
            body: SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    padding: EdgeInsets.only(
                      left: AppDimens.screenHorizontalPadding,
                      right: AppDimens.screenHorizontalPadding,
                      bottom: MediaQuery.of(context).viewInsets.bottom +
                          AppDimens.screenVerticalPadding,
                    ),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: constraints.maxHeight),
                      child: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 500),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "Create Your Account",
                                style: textTheme.displaySmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: colorScheme.onSurface,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: AppDimens.spacerHeightMedium),
                              Text(
                                "Join SuperSUD to secure your future.",
                                style: textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.w300,
                                  color: colorScheme.onSurface,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 40),
                              TextFormField(
                                initialValue: uiState.email,
                                onChanged: viewModel.updateEmail,
                                cursorColor: colorScheme.primary,
                                decoration: _inputDecoration("Email", colorScheme),
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                              ),
                              const SizedBox(height: AppDimens.mediumPadding),
                              TextFormField(
                                initialValue: uiState.phoneNumber,
                                onChanged: viewModel.updatePhoneNumber,
                                cursorColor: colorScheme.primary,
                                decoration: _inputDecoration("Phone Number", colorScheme),
                                keyboardType: TextInputType.phone,
                                textInputAction: TextInputAction.next,
                              ),
                              const SizedBox(height: AppDimens.mediumPadding),
                              _PasswordTextField(
                                value: uiState.password,
                                onChanged: viewModel.updatePassword,
                                labelText: "Password",
                              ),
                              const SizedBox(height: AppDimens.mediumPadding),
                              _PasswordTextField(
                                value: uiState.confirmPassword,
                                onChanged: viewModel.updateConfirmPassword,
                                labelText: "Confirm Password",
                              ),
                              if (uiState.errorMessage != null)
                                Padding(
                                  padding: const EdgeInsets.only(top: AppDimens.smallPadding),
                                  child: Text(
                                    uiState.errorMessage!,
                                    style: textTheme.labelSmall?.copyWith(
                                      color: colorScheme.error,
                                    ),
                                  ),
                                ),
                              const SizedBox(height: AppDimens.largePadding),
                              AppElevatedButton(
                                onPressed: viewModel.signup,
                                text: "Sign Up",
                                isLoading: uiState.isLoading,
                                backgroundColor: colorScheme.primary,
                                foregroundColor: colorScheme.onPrimary,
                              ),
                              const SizedBox(height: AppDimens.spacerHeightMedium),
                              TextButton(
                                onPressed: () {
                                  context.go('/login');
                                },
                                child: Text(
                                  "Already have an account? Log In",
                                  style: textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.w300,
                                    color: colorScheme.secondary,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  InputDecoration _inputDecoration(String label, ColorScheme colorScheme) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: colorScheme.onSurfaceVariant),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colorScheme.primary),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colorScheme.outline),
      ),
      floatingLabelStyle: TextStyle(color: colorScheme.primary),
    );
  }
}

class _PasswordTextField extends StatefulWidget {
  final String value;
  final ValueChanged<String> onChanged;
  final String labelText;

  const _PasswordTextField({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.labelText,
  }) : super(key: key);

  @override
  State<_PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<_PasswordTextField> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return TextFormField(
      initialValue: widget.value,
      onChanged: widget.onChanged,
      obscureText: !_passwordVisible,
      cursorColor: colorScheme.primary,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(color: colorScheme.onSurfaceVariant),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.primary),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        floatingLabelStyle: TextStyle(color: colorScheme.primary),
        suffixIcon: IconButton(
          icon: Icon(
            _passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: colorScheme.onSurfaceVariant,
          ),
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
      ),
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
    );
  }
}
