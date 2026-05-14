class ApiConstants {
  static const String baseUrl = 'https://flight.wigian.in/flight_api.php';
  
  static const String searchFlights = '/search';
  static const String getFlightDetails = '/flight';
  static const String getAirportsFrom = '/airports/from';
  static const String getAirportsTo = '/airports/to';
  static const String getAirlines = '/airlines';
  static const String getAircraftTypes = '/aircraft-types';

  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;
}
