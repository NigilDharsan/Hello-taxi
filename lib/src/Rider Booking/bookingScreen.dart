import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hellotaxi/utils/core/helper/route_helper.dart';
import 'package:hellotaxi/utils/images.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  late GoogleMapController mapController;
  final PanelController _panelController = PanelController();
  final LatLng markerLocation =
      const LatLng(11.0168, 76.9558); // Example coordinates
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 5));
      _showRideBookedDialog();
    });
  }

  Future<void> _showRideBookedDialog() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text(
            "Your ride has been successfully booked!",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 50,
                  padding: const EdgeInsets.all(1),
                  margin: const EdgeInsets.symmetric(vertical: 1),
                  color: Colors.indigo,
                  child: TextButton(
                    onPressed: () {
                      // Navigator.of(context).pushReplacement(
                      //   MaterialPageRoute(
                      //       builder: (context) => const TripPage()),
                      // );
                      Navigator.of(context).pop();
                      Get.toNamed(RouteHelper.ridecompletedscreen);
                    },
                    child: const Text(
                      "OK",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        controller: _panelController,
        minHeight: 300, // Minimum height when collapsed
        maxHeight:
            MediaQuery.of(context).size.height * 0.6, // 60% of screen height
        borderRadius: const BorderRadius.vertical(top: Radius.circular(1)),
        panel: _buildSlidingPanelContent(),
      ),
    );
  }

  Widget _buildSlidingPanelContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.grey[350],
              child: const Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    Text('PIN: ',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    Text('6598',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text('|',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text('On the way', style: TextStyle(fontSize: 15)),
                  ],
                ),
              ),
            ),

            // Vehicle Details
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 0.7,
              child: const Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    Text('TN 50 S 8684 -',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                    SizedBox(width: 10),
                    Text('Suzuki Swift (White)',
                        style: TextStyle(fontSize: 15)),
                  ],
                ),
              ),
            ),

            // Driver Details
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Image.asset(Images.user, width: 80, height: 80),
                    const SizedBox(width: 10),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Nigil',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500)),
                        Text('Total Trips: 5', style: TextStyle(fontSize: 13)),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      icon: Icon(Icons.call, color: Colors.green),
                      onPressed: () {
                        // WhatsApp action
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Route Details
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.location_on),
                        SizedBox(width: 8),
                        Text('Gandhipuram',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                      ],
                    ),
                    const Divider(),
                    const Row(
                      children: [
                        Icon(Icons.location_on),
                        SizedBox(width: 8),
                        Text('Singanallur',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                      ],
                    ),
                    const Divider(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton.icon(
                        onPressed: () {
                          // Cancel action
                        },
                        icon: const Icon(Icons.cancel_outlined),
                        label: const Text('Cancel',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Trip Fare
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Trip Fare ₹50',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Paid by', style: TextStyle(fontSize: 14)),
                        Text('Cash', style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
