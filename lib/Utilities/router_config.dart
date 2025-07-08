import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:template_2025/Utilities/shared_preferences.dart';

import '../Modules/Auth/email_input_screen.dart';
import '../Modules/Auth/final_verify_screen.dart';
import '../Modules/Auth/otp_verification_screen.dart';
import '../Modules/Auth/reset_phone_screen.dart';

import '../Modules/Home/home_screen.dart';
import '../Modules/Login/login_screen.dart';
import '../Modules/Splash/splash_screen.dart';
import '../Modules/on boarding/on_boarding.dart';

BuildContext? get currentContext_ =>
    GoRouterConfig.router.routerDelegate.navigatorKey.currentContext;

class GoRouterConfig {
  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      // Splash Screen
      GoRoute(
        path: SplashScreen.routeName,
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child: const SplashScreen(),
          );
        },
      ),

      // Onboarding
      GoRoute(
        path: OnboardingScreen.routeName,
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child: const OnboardingScreen(),
          );
        },
      ),

      // Login
      GoRoute(
        path: LoginScreen.routeName,
        name: LoginScreen.routeName,
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child: const LoginScreen(),
          );
        },
      ),

      // Step 1: Enter Email
      GoRoute(
        path: EmailInputScreen.routeName,
        name: EmailInputScreen.routeName,
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child: const EmailInputScreen(),
          );
        },
      ),

      // Step 2: OTP Verification - NEEDS email from extra
      GoRoute(
        path: OtpVerificationScreen.routeName,
        name: OtpVerificationScreen.routeName,
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child: OtpVerificationScreen(
              email: state.extra as String,
            ),
          );
        },
      ),

      // Step 3: Reset Phone - NEEDS email from extra
      GoRoute(
        path: ResetPhoneScreen.routeName,
        name: ResetPhoneScreen.routeName,
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child: ResetPhoneScreen(
              email: state.extra as String,
            ),
          );
        },
      ),

      // Step 4: Final Verify - NEEDS email from extra
      GoRoute(
        path: FinalVerifyScreen.routeName,
        name: FinalVerifyScreen.routeName,
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child: FinalVerifyScreen(
              email: state.extra as String,
            ),
          );
        },
      ),

      // Home
      GoRoute(
        path: HomeScreen.routeName,
        name: HomeScreen.routeName,
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child: const HomeScreen(),
          );
        },
      ),
    ],

    // Redirect (optional)
    redirect: (BuildContext context, GoRouterState state) {
       if (!SharedPref.isLogin()) return LoginScreen.routeName;
       if (state.matchedLocation == LoginScreen.routeName && SharedPref.isLogin()) return HomeScreen.routeName;
      return null;
    },
  );

  static CustomTransitionPage getCustomTransitionPage({
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: child,
        );
      },
    );
  }
}
