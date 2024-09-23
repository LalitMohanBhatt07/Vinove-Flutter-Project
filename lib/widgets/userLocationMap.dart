import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class UserLocationMap extends StatefulWidget {
  final List<Map<String, String>> members;

  UserLocationMap({required this.members});

  @override
  _UserLocationMapState createState() => _UserLocationMapState();
}

class _UserLocationMapState extends State<UserLocationMap> {
  GoogleMapController? _mapController;
  LatLng _initialPosition = LatLng(37.7749, -122.4194); // Default position (San Francisco)
  List<Marker> _markers = [];

  @override
  void initState() {
    super.initState();
    _setMemberMarkers();
  }

  Future<void> _setMemberMarkers() async {
    List<Marker> markers = [];
    for (var member in widget.members) {
      String address = member['address']!;
      try {
        // Geocoding: Get latitude and longitude from address
        List<Location> locations = await locationFromAddress(address);
        if (locations.isNotEmpty) {
          LatLng position = LatLng(locations[0].latitude, locations[0].longitude);
          markers.add(Marker(
            markerId: MarkerId(member['id']!),
            position: position,
            infoWindow: InfoWindow(
              title: member['name'],
              snippet: member['address'],
            ),
          ));
        }
      } catch (e) {
        print('Error getting location for address: $address, error: $e');
      }
    }

    setState(() {
      _markers = markers;
      if (_markers.isNotEmpty) {
        _initialPosition = _markers.first.position;
        _mapController?.animateCamera(CameraUpdate.newLatLngZoom(_initialPosition, 10));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Locations')),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _initialPosition,
          zoom: 10,
        ),
        markers: Set<Marker>.of(_markers),
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
        },
      ),
    );
  }
}
