import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hellotaxi/src/Dashboard/Controller/dashBoardController.dart';
import 'package:hellotaxi/utils/images.dart';
import 'package:hellotaxi/utils/styles.dart';

class Cash_Screen extends StatefulWidget {
  const Cash_Screen({super.key});

  @override
  _Cash_ScreenState createState() => _Cash_ScreenState();
}

class _Cash_ScreenState extends State<Cash_Screen>
    with TickerProviderStateMixin {
  GoogleMapController? mapController;
  String selectedOption = '';
  String? _cash;
  LatLng markerLocation = const LatLng(11.02713, 77.02425);
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[50],
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: _buildRideOptions(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: _isPressed ? Colors.indigo : Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              _isPressed = true;
                            });
                            _navigateAndSelectPayment(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.black,
                                    child: Icon(Icons.currency_rupee,
                                        size: 24, color: Colors.white),
                                  ),
                                  const SizedBox(width: 10),
                                  const Text(
                                    'Cash',
                                    style: nameBold,
                                  ),
                                ],
                              ),
                              const Icon(Icons.arrow_drop_down,
                                  size: 24, color: Colors.black),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.indigo,
                              ),
                              child: TextButton(
                                onPressed: () {
                                  Get.find<DashBoardController>()
                                      .screenType
                                      .value = "Rider Search";

                                  // if (_cash != null) {
                                  // Navigator.of(context).pushReplacement(
                                  //   MaterialPageRoute(
                                  //       builder: (context) =>
                                  //           const GifScreen()),
                                  // );
                                  // } else {
                                  //   _showPopup(context);
                                  // }
                                },
                                child: const Text(
                                  "Book Ride",
                                  style: conBold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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

  List<Widget> _buildRideOptions() {
    return [
      _buildRideOption('Micro', '₹105 - ₹145', Images.carimage),
      _buildRideOption('Mini', '₹108 - ₹152', Images.carimage),
      _buildRideOption('Sedan', '₹109 - ₹155', Images.carimage),
    ];
  }

  Widget _buildRideOption(String title, String price, String assetPath) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = title;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: selectedOption == title ? Colors.indigo : Colors.grey,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(assetPath, width: 50, height: 50),
            const SizedBox(height: 5),
            Text(title, style: nameBold,),
            Text(price, style: logBold),
          ],
        ),
      ),
    );
  }

  void _navigateAndSelectPayment(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: MediaQuery.of(context).size.width - 40,
              height: 200,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'Payment Method',
                        style: nameBold,
                      ),
                      Spacer(),
                      IconButton(
                        icon: const Icon(Icons.clear, size: 30),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),

                  ListTile(
                    leading: Image.asset(Images.rupees, width: 50, height: 50),
                    title:  Text('Cash',style: delta,),
                    trailing: Radio<String>(
                      value: 'Cash',
                      groupValue: "Cash", // Use nullable variable
                      activeColor: Colors.indigo,
                      onChanged: (String? value) {
                        setState(() {
                          // Update main UI state after selection
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          minimumSize: const Size(double.infinity, 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          // if (_cash != null) {
                          // Navigator.of(context).pushReplacement(
                          //   MaterialPageRoute(
                          //       builder: (context) => const GifScreen()),
                          // );
                          // } else {
                          //   _showPopup(context);
                          // }
                        },
                        child: const Text(
                          "Done",
                          style: conBold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Payment Required"),
          content: const Text("Please select a cash amount before booking."),
          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
