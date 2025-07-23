import 'package:flutter/material.dart';
import 'package:supersud/core/theme/app_dimens.dart';

class AppElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Widget? leadingIcon;
  final Widget? trailingIcon;

  const AppElevatedButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
    this.backgroundColor,
    this.foregroundColor,
    this.leadingIcon,
    this.trailingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color effectiveForeground = foregroundColor ?? Colors.white;

    return SizedBox(
      width: double.infinity,
      height: AppDimens.buttonHeight,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? colorScheme.primary,
          foregroundColor: effectiveForeground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.cardCornerRadius),
          ),
        ),
        child: isLoading
            ? CircularProgressIndicator(
          color: effectiveForeground,
          strokeWidth: 2.0,
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leadingIcon != null) ...[
              leadingIcon!,
              const SizedBox(width: AppDimens.smallPadding),
            ],
            Text(
              text,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: effectiveForeground, // force white text
              ),
            ),
            if (trailingIcon != null) ...[
              const SizedBox(width: AppDimens.smallPadding),
              trailingIcon!,
            ],
          ],
        ),
      ),
    );
  }
}
