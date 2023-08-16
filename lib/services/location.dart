import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
class Location{
  var _latitude;
  var _longitude;
  Future<void> getLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      _longitude = position.longitude;
      _latitude = position.latitude;
    } catch (e) {
      print(e);
    }
  }

  get longitude => _longitude;
  get latitude => _latitude;
}