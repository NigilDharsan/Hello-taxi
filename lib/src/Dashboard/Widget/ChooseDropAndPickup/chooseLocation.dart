import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellotaxi/utils/core/helper/route_helper.dart';

void selectLocation(BuildContext context, bool isPickup) {
  TextEditingController searchController = TextEditingController();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Allow sheet to expand
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context)
                  .viewInsets
                  .bottom, // Adjust for keyboard
            ),
            height: 550, // 50% screen height
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize:
                      MainAxisSize.min, // Prevent unnecessary expansion
                  children: [
                    // Title & Close Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          isPickup
                              ? 'Choose Rider Pickup Location'
                              : 'Choose Rider Drop Location',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.clear, color: Colors.black),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // Search Field
                    TextField(
                      controller: searchController,
                      onChanged: (value) {
                        setState(() {}); // Refresh UI on text change
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'Search the location',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Hide "Choose Map" & "Popular Destinations" when searching
                    if (searchController.text.isEmpty) ...[
                      // Choose Map Card
                      Card(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          leading: const Icon(Icons.location_on,
                              color: Colors.indigo),
                          title: const Text('Choose Map'),
                          onTap: () {
                            Get.toNamed(RouteHelper.getChooseMapRoute());
                          },
                        ),
                      ),

                      const Divider(),
                      const Text(
                        'Popular Destinations',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 10),

                      _destinationCard('Chennai'),
                      _destinationCard('Bangalore'),
                      _destinationCard('Mangalore'),
                    ],
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}

Widget _destinationCard(String location) {
  return Card(
    margin: const EdgeInsets.symmetric(vertical: 10),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child: ListTile(
      leading: const Icon(Icons.location_on, color: Colors.red),
      title: Text(location),
      onTap: () {
        // Action for selected location
      },
    ),
  );
}
