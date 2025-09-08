import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/counter/presentation/atomic/pages/counter_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import 'route_paths.dart';

/// Application router configuration using go_router
class AppRouter {
  // Private constructor to prevent instantiation
  AppRouter._();

  static final GoRouter _router = GoRouter(
    initialLocation: RoutePaths.splash,
    debugLogDiagnostics: true,
    routes: [
      // Splash Route
      GoRoute(
        path: RoutePaths.splash,
        name: 'splash',
        builder: (context, state) => const SplashPage(),
      ),
      
      // Home Route
      GoRoute(
        path: RoutePaths.home,
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      
      // Counter Route
      GoRoute(
        path: RoutePaths.counter,
        name: 'counter',
        builder: (context, state) => const CounterPage(),
      ),
      
      // Auth Routes
      GoRoute(
        path: RoutePaths.auth,
        name: 'auth',
        builder: (context, state) => const CounterPage(), // TODO: Replace with actual auth page
        routes: [
          GoRoute(
            path: 'sign-in',
            name: 'sign-in',
            builder: (context, state) => const CounterPage(), // TODO: Replace with sign-in page
          ),
          GoRoute(
            path: 'sign-up',
            name: 'sign-up',
            builder: (context, state) => const CounterPage(), // TODO: Replace with sign-up page
          ),
          GoRoute(
            path: 'forgot-password',
            name: 'forgot-password',
            builder: (context, state) => const CounterPage(), // TODO: Replace with forgot password page
          ),
        ],
      ),
      
      // Counter Detail Route
      GoRoute(
        path: RoutePaths.counterDetail,
        name: 'counter-detail',
        builder: (context, state) => const CounterPage(), // TODO: Replace with counter detail page
      ),
    ],
    
    // Error handling
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              'Page not found',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'The page "${state.uri}" could not be found.',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go(RoutePaths.home),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    ),
  );

  /// Get the configured router instance
  static GoRouter get router => _router;
}
