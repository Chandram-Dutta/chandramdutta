import 'package:chandramdutta/routes/go_routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final goRouteAndroidProvider = Provider<GoRouter>((ref) {
  return androidRoutes;
});

final goRouteiOSProvider = Provider<GoRouter>((ref) {
  return iOSRoutes;
});

final osTypeProvider = StateProvider<int>((ref) {
  return 0;
});
