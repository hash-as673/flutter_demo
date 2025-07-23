import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:supersud/core/theme/app_dimens.dart';
import 'package:supersud/core/widgets/app_elevated_button.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.screenHorizontalPadding,
                  vertical: AppDimens.screenVerticalPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30.0),
                    SvgPicture.asset(
                      'assets/images/sudlife-logo.svg',
                      width: 100.0,
                      height: 100.0,
                    ),
                    const SizedBox(height: AppDimens.spacerHeightMedium),
                    Text(
                      "is a one-stop solution for your insurance and financial needs.",
                      style: textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w300,
                        color: colorScheme.onBackground.withOpacity(0.7),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 60.0),
                    Image.asset(
                      'assets/images/intro_image.png',
                      width: double.infinity,
                      height: 350.0,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: AppDimens.screenHorizontalPadding,
              right: AppDimens.screenHorizontalPadding,
              top: AppDimens.screenVerticalPadding / 2,
              bottom:
                  MediaQuery.of(context).padding.bottom +
                  (AppDimens.screenVerticalPadding / 2),
            ),
            child: SizedBox(
              width: double.infinity,
              child: AppElevatedButton(
                onPressed: () {
                  context.go('/signup');
                },
                text: "Get Started",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
