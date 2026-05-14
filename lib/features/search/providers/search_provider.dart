import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/flight_service.dart';
import '../models/airport_model.dart';
import '../models/flight_model.dart';
import '../models/airline_model.dart';
import '../models/aircraft_type_model.dart';

final airportSearchProvider = FutureProvider.family<List<Airport>, ({String query, bool isFrom})>((ref, arg) async {
  final service = ref.watch(flightServiceProvider);
  if (arg.isFrom) {
    return service.getAirportsFrom(arg.query);
  } else {
    return service.getAirportsTo(arg.query);
  }
});

final flightSearchProvider = FutureProvider.family<List<Flight>, Map<String, dynamic>>((ref, params) async {
  final service = ref.watch(flightServiceProvider);
  return service.searchFlights(
    fromCode: params['from'],
    toCode: params['to'],
    date: params['date'],
    passengers: params['passengers'],
    filters: params['filters'],
    sortBy: params['sort_by'],
    page: params['page'] ?? 1,
    limit: params['limit'] ?? 10,
  );
});

final airlinesProvider = FutureProvider<List<Airline>>((ref) async {
  return ref.watch(flightServiceProvider).getAirlines();
});

final aircraftTypesProvider = FutureProvider<List<AircraftType>>((ref) async {
  return ref.watch(flightServiceProvider).getAircraftTypes();
});


