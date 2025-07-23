
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/presentation/pages/login_screen.dart';
import '../features/auth/presentation/pages/signup_screen.dart';
import '../features/landing/presentation/landing_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    _platformAwareRoute(
      path: '/',
      name: 'landing',
      child: const LandingScreen(),
    ),
    _platformAwareRoute(
      path: '/login',
      name: 'login',
      child: const LoginScreen(),
    ),
    _platformAwareRoute(
      path: '/signup',
      name: 'signup',
      child: const SignupScreen(),
    ),
  ],
);

GoRoute _platformAwareRoute({
  required String path,
  required String name,
  required Widget child,
}) {
  return GoRoute(
    path: path,
    name: name,
    pageBuilder: (context, state) {
      final platform = defaultTargetPlatform;

      switch (platform) {
        case TargetPlatform.iOS:
        case TargetPlatform.macOS:
        // For iOS/macOS, CupertinoPage already provides native-like slide transitions.
        // You can further customize it with CustomTransitionPage if needed,
        // but for a basic native feel, CupertinoPage is often sufficient.
          return CupertinoPage(child: child, key: state.pageKey);
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
        case TargetPlatform.linux:
        case TargetPlatform.windows:
        default:
        // For Android and other platforms, use CustomTransitionPage
        // to define a specific slide-from-right transition.
          return CustomTransitionPage(
            key: state.pageKey,
            child: child,
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              // This creates a slide-in from right animation.
              // The offset goes from (1.0, 0.0) meaning fully off-screen to the right,
              // to (0.0, 0.0) meaning its final position.
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.easeOutCubic; // A good curve for smooth transitions

              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
            // You can adjust the transition duration as needed
            transitionDuration: const Duration(milliseconds: 300),
            // Optionally, you can also define a reverseTransitionDuration
            // reverseTransitionDuration: const Duration(milliseconds: 200),
          );
      }
    },
  );
}