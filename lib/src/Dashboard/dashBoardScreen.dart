import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hellotaxi/src/Dashboard/Controller/dashBoardController.dart';
import 'package:hellotaxi/src/Dashboard/Widget/Book%20Rider/book_rider.dart';
import 'package:hellotaxi/src/Dashboard/Widget/ChooseDropAndPickup/MainDesign.dart';
import 'package:hellotaxi/src/Dashboard/Widget/DrawerPage.dart';
import 'package:hellotaxi/src/RiderSearch/riderSearchScreen.dart';
import 'package:location/location.dart' as loc;
// import 'package:flutter/services.dart'; // Import this for SystemChrome

import '../Rider Booking/bookingScreen.dart';
import '../RiderHistory/rideCompleteDetails.dart';

class Dashboardscreen extends StatefulWidget {
  const Dashboardscreen({super.key});

  @override
  State<Dashboardscreen> createState() => _DashboardscreenState();
}

class _DashboardscreenState extends State<Dashboardscreen> {
  DateTime timeBackPressed = DateTime.now();
  bool warningShown = false;
  late GoogleMapController mapController;
  late LatLng _initialPosition =
      const LatLng(11.004556, 76.961632); // Coimbatore
  bool _isLoading = true; // Loading state
  bool isSelected = false;
  bool ispinkSelected = false;

  loc.Location _location = loc.Location();
  LatLng _currentPosition =
      const LatLng(37.7749, -122.4194); // Default: San Francisco
  LatLng _destination = const LatLng(37.7849, -122.4094); // Example destination
  List<LatLng> _routeCoords = [];

  @override
  void initState() {
    super.initState();
    _getUserLocation(); // Get user location when the screen loads
  }

  Future<void> _getUserLocation() async {
    bool serviceEnabled;
    geo.LocationPermission permission;
    serviceEnabled = await geo.Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print("Location services are disabled.");
      return;
    }
    permission = await geo.Geolocator.checkPermission();
    if (permission == geo.LocationPermission.denied) {
      permission = await geo.Geolocator.requestPermission();
      if (permission == geo.LocationPermission.denied) {
        print("Location permissions are denied.");
        return;
      }
    }

    if (permission == geo.LocationPermission.deniedForever) {
      print("Location permissions are permanently denied.");
      return;
    }

    // Get current position
    geo.Position position = await geo.Geolocator.getCurrentPosition(
        desiredAccuracy: geo.LocationAccuracy.high);

    setState(() {
      _initialPosition = LatLng(position.latitude, position.longitude);
      _isLoading = false; // Map is ready
    });
  }

  void _startLiveTracking() {
    _location.onLocationChanged.listen((loc.LocationData locationData) {
      if (locationData.latitude != null && locationData.longitude != null) {
        setState(() {
          _currentPosition =
              LatLng(locationData.latitude!, locationData.longitude!);
        });
        mapController?.animateCamera(
          CameraUpdate.newLatLng(_currentPosition),
        );
      }
    });
  }

  // Fetch route points using Google Directions API
  void _getRoutePoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey: "AIzaSyAq4kppEUeT17-uW7Uly3te60kJDS2vxt8",
      request: PolylineRequest(
        origin:
            PointLatLng(_currentPosition.latitude, _currentPosition.longitude),
        destination: PointLatLng(_destination.latitude, _destination.longitude),
        mode: TravelMode.driving,
        wayPoints: [PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria")],
      ),
    );
    print(result.points);
    if (result.points.isNotEmpty) {
      setState(() {
        _routeCoords =
            result.points.map((p) => LatLng(p.latitude, p.longitude)).toList();
      });
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {

  return WillPopScope(
      onWillPop: () async {
        final difference = DateTime.now().difference(timeBackPressed);
        final isExitWarning = difference >= const Duration(seconds: 2);
        timeBackPressed = DateTime.now();
        if (isExitWarning) {
          warningShown = false;
        }
        if (!warningShown) {
          warningShown = true;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Press back again to exit'),
            ),
          );
          return false;
        }
        return true;
      },
      child: GetBuilder<DashBoardController>(builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: <Widget>[
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: _initialPosition,
                  zoom: 15,
                ),
                onMapCreated: _onMapCreated,
                myLocationEnabled: true, // Enables user location
                mapType: MapType.normal, // Options: normal, satellite, terrain
              ),
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0, // Ensures it stays at the bottom
                  child: Obx(() {
                    return controller.screenType.value == ""
                        ? MainDesign()
                        : controller.screenType.value == "Rider Search"
                        ? RiderSearchScreen()
                        : controller.screenType.value == "booking screen"
                        ? BookingScreen()
                        : Cash_Screen();
                  })),
              Positioned(
                top: MediaQuery.of(context).padding.top + 20,
                left: 15,
                child: Builder(
                  builder: (context) => Container(
                    decoration: BoxDecoration(
                      color: Colors.indigo[900],
                      shape: BoxShape.circle,
                    ),
                    child: Obx(() {
                      return controller.screenType.value == ""
                          ? IconButton(
                              icon: const Icon(Icons.menu),
                              color: Colors.white,
                              onPressed: () {
                                Scaffold.of(context).openDrawer();
                              },
                            )
                          : IconButton(
                              icon: const Icon(Icons.arrow_back),
                              color: Colors.white,
                              onPressed: () {
                                controller.screenType.value = "";
                              },
                            );
                    }),
                  ),
                ),
              ),
            ],
          ),
          drawer: DrawerPage(),
        );
      }),
    );
  }
}
