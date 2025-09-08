import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/routes/route_paths.dart';

/// Navigation service for handling app navigation
/// This service provides a centralized way to handle navigation throughout the app
class NavigationService {
  // Private constructor to prevent instantiation
  NavigationService._();

  static final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  /// Get the navigator key
  static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  /// Get the current context
  static BuildContext? get currentContext => _navigatorKey.currentContext;

  /// Navigate to a specific route
  static void go(String route) {
    final context = currentContext;
    if (context != null) {
      context.go(route);
    }
  }

  /// Navigate to a specific route with name
  static void goNamed(String name, {Map<String, String>? pathParameters, Map<String, dynamic>? queryParameters}) {
    final context = currentContext;
    if (context != null) {
      context.goNamed(
        name, 
        pathParameters: pathParameters ?? {}, 
        queryParameters: queryParameters ?? {},
      );
    }
  }

  /// Push a new route onto the stack
  static void push(String route) {
    final context = currentContext;
    if (context != null) {
      context.push(route);
    }
  }

  /// Push a new route with name onto the stack
  static void pushNamed(String name, {Map<String, String>? pathParameters, Map<String, dynamic>? queryParameters}) {
    final context = currentContext;
    if (context != null) {
      context.pushNamed(
        name, 
        pathParameters: pathParameters ?? {}, 
        queryParameters: queryParameters ?? {},
      );
    }
  }

  /// Pop the current route
  static void pop([dynamic result]) {
    final context = currentContext;
    if (context != null) {
      context.pop(result);
    }
  }

  /// Check if we can pop the current route
  static bool canPop() {
    final context = currentContext;
    return context?.canPop() ?? false;
  }

  /// Pop until a specific route
  static void popUntil(String route) {
    final context = currentContext;
    if (context != null) {
      context.go(route);
    }
  }

  /// Replace the current route
  static void replace(String route) {
    final context = currentContext;
    if (context != null) {
      context.pushReplacement(route);
    }
  }

  /// Replace the current route with name
  static void replaceNamed(String name, {Map<String, String>? pathParameters, Map<String, dynamic>? queryParameters}) {
    final context = currentContext;
    if (context != null) {
      context.pushReplacementNamed(
        name, 
        pathParameters: pathParameters ?? {}, 
        queryParameters: queryParameters ?? {},
      );
    }
  }

  // Convenience methods for common routes

  /// Navigate to splash screen
  static void goToSplash() => go(RoutePaths.splash);

  /// Navigate to home screen
  static void goToHome() => go(RoutePaths.home);

  /// Navigate to counter screen
  static void goToCounter() => go(RoutePaths.counter);

  /// Navigate to auth screen
  static void goToAuth() => go(RoutePaths.auth);

  /// Navigate to sign in screen
  static void goToSignIn() => go(RoutePaths.signIn);

  /// Navigate to sign up screen
  static void goToSignUp() => go(RoutePaths.signUp);

  /// Navigate to forgot password screen
  static void goToForgotPassword() => go(RoutePaths.forgotPassword);

  /// Navigate to counter detail screen
  static void goToCounterDetail() => go(RoutePaths.counterDetail);

  /// Show a snackbar
  static void showSnackBar(String message, {Duration? duration, Color? backgroundColor}) {
    final context = currentContext;
    if (context != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: duration ?? const Duration(seconds: 3),
          backgroundColor: backgroundColor,
        ),
      );
    }
  }

  /// Show a dialog
  static Future<T?> showAppDialog<T>({
    required Widget Function(BuildContext) builder,
    bool barrierDismissible = true,
  }) {
    final context = currentContext;
    if (context != null) {
      return showDialog<T>(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: builder,
      );
    }
    return Future.value(null);
  }

  /// Show a bottom sheet
  static Future<T?> showBottomSheet<T>({
    required Widget Function(BuildContext) builder,
    bool isDismissible = true,
    bool enableDrag = true,
  }) {
    final context = currentContext;
    if (context != null) {
      return showModalBottomSheet<T>(
        context: context,
        isDismissible: isDismissible,
        enableDrag: enableDrag,
        builder: builder,
      );
    }
    return Future.value(null);
  }
}
