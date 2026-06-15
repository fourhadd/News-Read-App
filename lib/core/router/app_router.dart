// core/router/app_router.dart
// import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:news_feed/features/home/presentation/pages/home_page.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/onboarding',
    routes: [
      GoRoute(
        path: '/onboarding',

        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(path: '/home', builder: (context, state) => const HomePage()),
    ],
  );
}
