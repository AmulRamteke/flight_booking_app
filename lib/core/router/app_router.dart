import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/search/screens/search_screen.dart';
import '../../features/search/screens/listing_screen.dart';
import '../../features/details/screens/details_screen.dart';


import '../../features/search/screens/splash_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/',
        name: 'search',
        builder: (context, state) => const FlightSearchScreen(),
      ),
      GoRoute(
        path: '/flights',
        name: 'flights',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return FlightListingScreen(searchParams: extra);
        },
      ),
      GoRoute(
        path: '/flight-details',
        name: 'flight-details',
        builder: (context, state) {
          final flightId = state.uri.queryParameters['id'] ?? '';
          final passengers = int.tryParse(state.uri.queryParameters['passengers'] ?? '1') ?? 1;
          final date = state.uri.queryParameters['date'] ?? '';
          return FlightDetailsScreen(flightId: flightId, passengers: passengers, date: date);
        },
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Page not found: ${state.error}'),
      ),
    ),
  );
});
