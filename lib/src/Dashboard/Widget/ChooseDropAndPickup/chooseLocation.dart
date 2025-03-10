import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellotaxi/utils/core/helper/route_helper.dart';
import 'package:hellotaxi/utils/styles.dart';

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
                          style: ubuntuRegular,
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
                        prefixIcon: const Icon(Icons.search,size: 30,),
                        hintText: 'Search the location',
                        hintStyle: logBold,
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
                          title: const Text('Choose on Map',
                          style: colorBold,),
                          onTap: () {
                            Get.toNamed(RouteHelper.getChooseMapRoute());
                          },
                        ),
                      ),

                      const Divider(),
                      const Text(
                        'Popular Destinations',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20,color: Colors.blueGrey),
                      ),
                      const SizedBox(height: 10),
                      ...destinationCards.map((item) => _destinationCard(item['location']!, item['color']!)).toList(),
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

Widget _destinationCard(String location, Color color) {
  return Card(
    margin: const EdgeInsets.symmetric(vertical: 10),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child: ListTile(
      leading: Icon(Icons.label_important, color: color, size: 30),
      title: Text(location, style: colorBold),
      onTap: () {
        // Action for selected location
      },
    ),
  );
}
final List<Map<String, dynamic>> destinationCards = [
  {"location": "Singanallur", "color": Colors.red},
  {"location": "Gandhipuram", "color": Colors.green},
  {"location": "ukkadam", "color": Colors.blue},
];