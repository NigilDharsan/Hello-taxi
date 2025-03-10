import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellotaxi/src/RiderHistory/Widget/rideCancelled.dart';
import 'package:hellotaxi/src/RiderHistory/Widget/rideCompleted.dart';

import '../../utils/styles.dart';

class RiderHistoryScreen extends StatefulWidget {
  const RiderHistoryScreen({super.key});

  @override
  State<RiderHistoryScreen> createState() => _RiderHistoryScreenState();
}

class _RiderHistoryScreenState extends State<RiderHistoryScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey[200], // Lighter grey background
        appBar: AppBar(
          backgroundColor: Colors.indigo[800], // Consistent background color
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Get.back();
              // Navigate back instead of pushing a new ProfilePage
            },
          ),
          title: const Text(
            'Ride History',
            style: con2Bold,
          ),
          bottom: PreferredSize(
            preferredSize:
                const Size.fromHeight(kToolbarHeight), // Correct size
            child: Container(
              color: Colors.white, // Background color of the TabBar
              child: const TabBar(
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                      width: 3, color: Colors.indigo), // Properly set indicator
                ),
                labelColor: Colors.indigo, // Selected tab text color
                unselectedLabelColor: Colors.black, // Unselected tab text color
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(text: 'COMPLETED',),
                  Tab(text: 'CANCELLED'),
                ],
              ),
            ),
          ),
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.indigo),
                ),
              )
            : const TabBarView(
                children: [
                  RideCompleted(),
                  RideCancelled(),
                ],
              ),
      ),
    );
  }
}
