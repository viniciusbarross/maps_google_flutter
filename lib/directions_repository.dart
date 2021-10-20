import 'package:dio/dio.dart';
import 'package:examplemaps/apikey.dart';
import 'package:examplemaps/directions.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DirectionsRepository {
  static const String _baseUri =
      'https://maps.googleapis.com/maps/api/directions/json?';

  final Dio? _dio = Dio();

  Future<Directions?> getDirections({
    required LatLng origin,
    required LatLng destination,
  }) async {
    final response = await _dio?.get(_baseUri, queryParameters: {
      'origin': '${origin.latitude},${origin.longitude}',
      'destination': '${destination.latitude},${destination.longitude}',
      'key': googleAPIKey
    });
    if (response!.statusCode == 200) {
      return Directions.fromMap(response.data);
    }
    return null;
  }
}
