import 'package:dio/dio.dart';
import '../models/airport_model.dart';
import '../models/flight_model.dart';
import '../models/airline_model.dart';
import '../models/aircraft_type_model.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/constants/api_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FlightService {
  final DioClient _dioClient;

  FlightService(this._dioClient);

  Future<List<Airport>> getAirportsFrom(String query) async {
    try {
      final response = await _dioClient.post(
        ApiConstants.getAirportsFrom,
        data: {'search': query},
      );

      if (response.data['status'] == 'success') {
        final List data = response.data['data']['airports'] ?? [];
        return data.map((json) => Airport.fromJson(json)).toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Airport>> getAirportsTo(String query) async {
    try {
      final response = await _dioClient.post(
        ApiConstants.getAirportsTo,
        data: {'search': query},
      );

      if (response.data['status'] == 'success') {
        final List data = response.data['data']['airports'] ?? [];
        return data.map((json) => Airport.fromJson(json)).toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Airline>> getAirlines({String? search}) async {
    try {
      final response = await _dioClient.post(
        ApiConstants.getAirlines,
        data: {'search': search ?? ''},
      );

      if (response.data['status'] == 'success') {
        final List data = response.data['data']['airlines'] ?? [];
        return data.map((json) => Airline.fromJson(json)).toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  Future<List<AircraftType>> getAircraftTypes({String? search}) async {
    try {
      final response = await _dioClient.post(
        ApiConstants.getAircraftTypes,
        data: {'search': search ?? ''},
      );

      if (response.data['status'] == 'success') {
        final List data = response.data['data']['aircraft_types'] ?? [];
        return data.map((json) => AircraftType.fromJson(json)).toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Flight>> searchFlights({
    required String fromCode,
    required String toCode,
    required String date,
    required int passengers,
    Map<String, dynamic>? filters,
    String? sortBy,
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final response = await _dioClient.post(
        ApiConstants.searchFlights,
        data: {
          'from': fromCode,
          'to': toCode,
          'date': date,
          'passengers': passengers,
          'filters':
              filters ??
              {
                'airline': '',
                'price_min': 0,
                'price_max': 0,
                'stops': 0,
                'aircraft_type': '',
              },
          'sort_by': sortBy ?? 'price_asc',
          'page': page,
          'limit': limit,
        },
      );

      if (response.data['status'] == 'success') {
        final List data = response.data['data']['flights'] ?? [];
        return data.map((json) => Flight.fromJson(json)).toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  Future<Flight> getFlightDetails(String flightId, {int passengers = 1}) async {
    try {
      final response = await _dioClient.post(
        ApiConstants.getFlightDetails,
        data: {
          'id': int.tryParse(flightId) ?? flightId,
          'passengers': passengers,
        },
      );

      if (response.data['status'] == 'success') {
        final data = response.data['data'];
        final Map<String, dynamic> flightData = Map.from(
          data['flight_details'] ?? data['flight'] ?? data,
        );

        // Merge extra details from the root of data if they exist
        List<dynamic> apiPassengers =
            data['passengers'] ?? flightData['passengers'] ?? [];

        // Ensure the list has exactly the requested number of passengers
        if (apiPassengers.length < passengers) {
          final existingCount = apiPassengers.length;
          final needed = passengers - existingCount;

          for (int i = 1; i <= needed; i++) {
            apiPassengers.add({
              'passenger_number': existingCount + i,
              'title': 'Mr.',
              'name': 'Passenger ${existingCount + i}',
              'seat':
                  '${String.fromCharCode(65 + (existingCount + i) % 6)}${10 + (existingCount + i)}',
            });
          }
        } else if (apiPassengers.length > passengers) {
          // If API returns more than requested, trim it
          apiPassengers = apiPassengers.sublist(0, passengers);
        }

        flightData['passengers'] = apiPassengers;

        // Ensure price exists to satisfy the model requirement
        if (flightData['price'] == null) {
          flightData['price'] = {'amount': 0.0, 'currency': 'USD'};
        }

        return Flight.fromJson(flightData);
      }
      throw Exception('Flight not found');
    } catch (e) {
      rethrow;
    }
  }
}

final flightServiceProvider = Provider<FlightService>((ref) {
  final dioClient = ref.read(apiClientProvider);
  return FlightService(dioClient);
});
