import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellotaxi/utils/core/helper/route_helper.dart';
import 'package:hellotaxi/utils/images.dart';
import 'package:hellotaxi/utils/styles.dart';

class RideCompleted extends StatefulWidget {
  const RideCompleted({super.key});

  @override
  State<RideCompleted> createState() => _RideCompletedState();
}

class _RideCompletedState extends State<RideCompleted> {
  bool isLoading = false; // Placeholder for loading state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.indigo),
              ),
            )
          : GestureDetector(
              onTap: () {
                Get.toNamed(RouteHelper.getRideCompleteDetailsRoute());
              },
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                        shrinkWrap:
                            true, // Ensures it does not take infinite height
                        physics:
                            const NeverScrollableScrollPhysics(), // Disable scrolling inside
                        itemCount: 5, // Generates 5 ride history cards
                        itemBuilder: (context, index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 1.0,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Sat, Feb 22, 01:32 pm',
                                        style: ubuntuMedium,
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        child: const Text(
                                          "₹0.00",
                                          style: rupees,
                                        ),
                                      ),
                                    ],
                                  ),
                                 Text(
                                    'HT250222487414',
                                    style: textBold,
                                  ),
                                  const SizedBox(height: 18), // Added spacing
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Sedan to',
                                        style: textBold,
                                      ),
                                      Image.asset(
                                        Images.ubar,
                                        width: 70, // Adjusted image size
                                        height: 50,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    // Removed Expanded wrapping the Row
                                    children: [
                                      const Icon(Icons.circle_outlined,
                                          color: Colors.indigo),
                                      const SizedBox(width: 3),
                                      Expanded(
                                        // Only wrapping Text inside Expanded
                                        child: Text(
                                          'Singanallur Bus Stand',
                                          style: logBold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
