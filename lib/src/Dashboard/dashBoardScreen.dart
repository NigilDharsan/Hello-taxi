import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hellotaxi/src/Dashboard/Widget/DrawerPage.dart';
import 'package:hellotaxi/src/Dashboard/Widget/Drop.dart';
import 'package:hellotaxi/src/Dashboard/Widget/Pickup.dart';
import 'package:hellotaxi/utils/images.dart';

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

  @override
  void initState() {
    super.initState();
    _getUserLocation(); // Get user location when the screen loads
  }

  Future<void> _getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print("Location services are disabled.");
      return;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print("Location permissions are denied.");
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print("Location permissions are permanently denied.");
      return;
    }

    // Get current position
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _initialPosition = LatLng(position.latitude, position.longitude);
      _isLoading = false; // Map is ready
    });
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
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            // GoogleMap(
            //   initialCameraPosition: CameraPosition(
            //     target: _initialPosition,
            //     zoom: 15,
            //   ),
            //   onMapCreated: _onMapCreated,
            //   myLocationEnabled: true, // Enables user location
            //   mapType: MapType.normal, // Options: normal, satellite, terrain
            // ),
            Positioned(
              left: 20,
              right: 20,
              bottom: 40, // Ensures it stays at the bottom
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  // Keeps it only as tall as needed
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            ispinkSelected = !ispinkSelected;
                          });
                          // Navigator.of(context).pushReplacement(
                          //   MaterialPageRoute(builder: (context) => const DrawerPage()),
                          // );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(color: Colors.black),
                            color:
                                ispinkSelected ? Colors.pink[50] : Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(Images.carimage,
                                  width: 50, height: 50),
                              const SizedBox(width: 8.0),
                              // Space between image and text
                              const Text(
                                'Local',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const PickupPage(), // These pages are properly placed
                    const DropPage(),
                  ],
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 20,
              left: 15,
              child: Builder(
                builder: (context) => Container(
                  decoration: BoxDecoration(
                    color: Colors.indigo[900],
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.menu),
                    color: Colors.white,
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        drawer: DrawerPage(),
      ),
    );
  }
}
