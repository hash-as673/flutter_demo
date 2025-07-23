import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:supersud/core/theme/app_dimens.dart';
import 'package:supersud/core/widgets/app_elevated_button.dart';
import 'package:supersud/features/auth/presentation/viewmodels/login_view_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:supersud/core/theme/app_dimens.dart';
import 'package:supersud/core/widgets/app_elevated_button.dart';
import 'package:supersud/features/auth/presentation/viewmodels/login_view_model.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: Consumer<LoginViewModel>(
        builder: (context, viewModel, child) {
          final colorScheme = Theme.of(context).colorScheme;
          final textTheme = Theme.of(context).textTheme;

          if (viewModel.uiState.isLoginSuccess) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (context.mounted) {
                context.pop();
                viewModel.resetLoginSuccess();
              }
            });
          }

          return Scaffold(
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 48),
                              Text(
                                "Login",
                                style: textTheme.displaySmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: colorScheme.onSurface,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: AppDimens.spacerHeightMedium),
                              Text(
                                "Login to continue your journey",
                                style: textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.w300,
                                  color: colorScheme.onSurface,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 64),
                              TextFormField(
                                initialValue: viewModel.uiState.email,
                                onChanged: viewModel.updateEmail,
                                cursorColor: colorScheme.primary,
                                decoration: InputDecoration(
                                  labelText: "Email",
                                  labelStyle: TextStyle(color: colorScheme.onSurfaceVariant),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: colorScheme.primary),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: colorScheme.outline),
                                  ),
                                  floatingLabelStyle: TextStyle(color: colorScheme.primary),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                              ),
                              const SizedBox(height: AppDimens.spacerHeightSmall),
                              _PasswordTextField(
                                value: viewModel.uiState.password,
                                onChanged: viewModel.updatePassword,
                                labelText: "Password",
                              ),
                              if (viewModel.uiState.errorMessage != null)
                                Padding(
                                  padding: const EdgeInsets.only(top: AppDimens.smallPadding),
                                  child: Text(
                                    viewModel.uiState.errorMessage!,
                                    style: textTheme.labelSmall?.copyWith(color: colorScheme.error),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              const SizedBox(height: AppDimens.spacerHeightMedium),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {
                                    debugPrint("Forgot Password clicked!");
                                  },
                                  child: Text(
                                    "Forgot Password?",
                                    style: textTheme.labelLarge?.copyWith(color: colorScheme.secondary),
                                  ),
                                ),
                              ),
                              const SizedBox(height: AppDimens.largePadding),
                              AppElevatedButton(
                                onPressed: () => viewModel.login,
                                text: "Log In",
                                isLoading: viewModel.uiState.isLoading,
                                backgroundColor: colorScheme.primary,
                                foregroundColor: colorScheme.onPrimary,
                              ),
                              const SizedBox(height: AppDimens.spacerHeightMedium),
                              SizedBox(
                                width: double.infinity,
                                height: AppDimens.buttonHeight,
                                child: OutlinedButton(
                                  onPressed: () {
                                    debugPrint("Login with Google clicked!");
                                  },
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(color: colorScheme.outline, width: 1.0),
                                    backgroundColor: colorScheme.surface,
                                    foregroundColor: colorScheme.onSurface,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(AppDimens.cardCornerRadius),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/google-icon-logo-svgrepo-com.svg',
                                        height: AppDimens.iconSizeMedium,
                                        width: AppDimens.iconSizeMedium,
                                      ),
                                      const SizedBox(width: AppDimens.smallPadding),
                                      Text(
                                        "Login with Google",
                                        style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: AppDimens.spacerHeightSmall),
                              TextButton(
                                onPressed: () => context.go('/signup'),
                                child: Text(
                                  "Don't have an account? Tap here and sign up!",
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
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

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