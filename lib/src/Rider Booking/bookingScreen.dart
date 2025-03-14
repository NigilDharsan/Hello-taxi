import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hellotaxi/utils/core/helper/route_helper.dart';
import 'package:hellotaxi/utils/images.dart';
import 'package:hellotaxi/utils/styles.dart';
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
    return SlidingUpPanel(
      controller: _panelController,
      minHeight: 300,
      // Minimum height when collapsed
      maxHeight: MediaQuery.of(context).size.height * 0.9,
      // 90% of screen height
      borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
      panel: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Drag Handle (Top Center)
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 8, bottom: 12),
                width: 60,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            // Distance & Arrival Time Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.grey[50],
                elevation: 0.7,
                child:  Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // Ensures everything is centered
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Distance',
                                style: change.copyWith(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 5),
                              // Space between text and value
                              Text(
                                '3.34 Km',
                                style: Card_T1,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          SizedBox(width: 30),
                          Text('|',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),

                          SizedBox(width: 40),
                          // Space between Distance and Arrival Time
                          Column(
                            children: [
                              Text(
                                'Arrival Time',
                                style: change.copyWith(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 5),
                              // Space between text and value
                              Text(
                                '9 min',
                                style:Card_T1,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  // Car Details
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.grey[50],
                    elevation: 0.7,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('TN 50 S 8684 -',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            SizedBox(width: 10),
                            Text('Sedan', style: colorBold),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Driver Details
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.grey[50],
                    elevation: 0.7,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Image.asset(Images.user, width: 80, height: 80),
                          const SizedBox(width: 10),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Nigil', style: nameBold),
                              Text('Total Trip of driver: 23', style: change),
                            ],
                          ),
                          const Spacer(),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: IconButton(
                              icon: const Icon(Icons.call,
                                  color: Colors.black, size: 25),
                              onPressed: () {
                                // Call action
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Route Details
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.grey[50],
                    elevation: 0.7,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 5),
                              Icon(Icons.location_on, color: Colors.green[900]),
                              Text('Gandhipuram', style: ubuntuMedium),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(width: 15),
                              DottedLine(
                                direction: Axis.vertical,
                                lineLength: 60,
                                lineThickness: 2,
                                dashLength: 6,
                                dashGapLength: 4,
                                dashColor: Colors.black,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(width: 5),
                              Icon(Icons.location_on, color: Colors.red[900]),
                              Text('Singanallur', style: ubuntuMedium),
                            ],
                          ),
                          const Divider(),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton.icon(
                              onPressed: () {
                                // Cancel action
                              },
                              icon: const Icon(Icons.clear,
                                  size: 30, color: Colors.red),
                              label: const Text('Cancel', style: colorBold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Trip Fare Details
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.grey[50],
                    elevation: 0.7,
                    child: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Trip Fare', style: tripBold),
                              Text('₹111 - ₹157',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Distance', style: tripBold),
                              Text('3.34 Km',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Payment Method', style: tripBold),
                              Text('Cash',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
