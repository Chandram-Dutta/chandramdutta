import 'package:chandramdutta/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ErrorScreen extends ConsumerWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    GoRouter route = ref.watch(goRouteAndroidProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Now Listen to Dumbledore'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(
                  "https://parade.com/.image/c_limit%2Ccs_srgb%2Cq_auto:good%2Cw_700/MTkwNTgwODc3NzY0MTQyOTcy/dumbledore-quotes.webp"),
            ),
            const Text(
              'Curiosity is not a sin, but we should exercise caution with our curiosity',
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                route.go('/android');
              },
              child: const Text("Route Error: Go Home"),
            )
          ],
        ),
      ),
    );
  }
}
