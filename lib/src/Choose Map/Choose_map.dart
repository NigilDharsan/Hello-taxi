import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hellotaxi/utils/styles.dart';
import 'package:http/http.dart' as http;

const String googleApiKey =
    'YOUR_GOOGLE_MAPS_API_KEY'; // Replace with your API Key

class Choose_Mapscreen extends StatefulWidget {
  final bool isPickup; // Determines if it's pickup or drop

  const Choose_Mapscreen({super.key, required this.isPickup});

  @override
  _Choose_MapscreenState createState() => _Choose_MapscreenState();
}

class _Choose_MapscreenState extends State<Choose_Mapscreen> {
  LatLng markerLocation = const LatLng(11.02713, 77.02425);
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.back();
            // Navigator.of(context).pushReplacement(
            //   MaterialPageRoute(builder: (context) => const MapPage()),
            // );
          },
        ),
        title: Text(
          widget.isPickup
              ? 'Choose Rider Pickup Location'
              : 'Choose Rider Drop Location', // Dynamic title
          style: ubuntuBold,
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: markerLocation,
              zoom: 15,
            ),
          ),
          const Center(
            child: Icon(Icons.location_on, size: 50, color: Colors.red),
          ),
          Positioned(
            top: 60,
            left: 15,
            right: 15,
            child: Column(
              children: [
                TypeAheadField<String>(
                  builder: (context, controller, focusNode) {
                    return TextField(
                      controller: controller,
                      focusNode: focusNode,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hintText: 'Search for location',
                        hintStyle: logBold
                      ),
                    );
                  },
                  suggestionsCallback: (pattern) async {
                    final response = await http.get(Uri.parse(
                      'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$pattern&key=$googleApiKey',
                    ));
                    final data = json.decode(response.body);

                    if (data['predictions'] != null) {
                      return (data['predictions'] as List)
                          .map((json) => json['description'] as String)
                          .toList();
                    }
                    return [];
                  },
                  itemBuilder: (context, String suggestion) {
                    return ListTile(
                      title: Text(suggestion),
                    );
                  },
                  onSelected: (String suggestion) {
                    setState(() {
                      searchController.text = suggestion;
                    });
                  },
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.indigo,
                ),
                child: TextButton(
                  onPressed: () {
                    Get.back();

                    // Navigator.of(context).pushReplacement(
                    //   MaterialPageRoute(builder: (context) => const MapPage()),
                    // );
                  },
                  child: const Text(
                    'Continue',
                    style: ubuntuBold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
