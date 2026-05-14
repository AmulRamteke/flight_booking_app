import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../search/services/flight_service.dart';
import '../../search/models/flight_model.dart';

final flightDetailsProvider = FutureProvider.family<Flight, ({String flightId, int passengers})>((ref, params) async {
  final service = ref.watch(flightServiceProvider);
  return service.getFlightDetails(params.flightId, passengers: params.passengers);
});
