import 'package:chandramdutta/presentation/screens/android_home_page.dart';
import 'package:chandramdutta/presentation/screens/error_screen.dart';
import 'package:chandramdutta/presentation/screens/ios_home_page.dart';
import 'package:go_router/go_router.dart';

GoRouter androidRoutes = GoRouter(
  initialLocation: '/android',
  errorBuilder: (context, state) => const ErrorScreen(),
  routes: [
    GoRoute(
      path: '/android',
      builder: (context, state) => const AndroidHomePage(),
    ),
  ],
);

GoRouter iOSRoutes = GoRouter(
  initialLocation: '/iOS',
  errorBuilder: (context, state) => const ErrorScreen(),
  routes: [
    GoRoute(
      path: '/iOS',
      builder: (context, state) => const IOSHomePage(),
    ),
  ],
);
