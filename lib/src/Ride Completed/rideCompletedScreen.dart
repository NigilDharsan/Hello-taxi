import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellotaxi/src/Dashboard/Controller/dashBoardController.dart';
import 'package:hellotaxi/utils/core/helper/route_helper.dart';

class RideCompletedScreen extends StatefulWidget {
  const RideCompletedScreen({super.key});

  @override
  State<RideCompletedScreen> createState() => _RideCompletedScreenState();
}

class _RideCompletedScreenState extends State<RideCompletedScreen> {
  bool backhome = false;
  bool dell = false;
  String selectedFeedback = ""; // Track selected emoji
  final Map<String, IconData> feedbackEmojis = {
    "awful": Icons.sentiment_very_dissatisfied,
    "bad": Icons.mood_bad_outlined,
    "okay": Icons.sentiment_neutral,
    "good": Icons.emoji_emotions,
    "great": Icons.sentiment_very_satisfied,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Navigator.of(context).pushReplacement(
            //   MaterialPageRoute(builder: (context) => const MapPage()),
            // );
            Get.find<DashBoardController>().screenType.value = "";

            Get.offAllNamed(RouteHelper.dashboardscreen);
          },
        ),
        title: const Text(
          "You've arrived",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Arial',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(color: Colors.grey[600]),
                child: Row(
                  children: [
                    Text(
                      'Making sure your belongings are \n'
                      'not left behind',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(child: Container()),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove_red_eye, color: Colors.green),
                          onPressed: () {
                            // Handle button press
                          },
                          padding: EdgeInsets.zero, // Remove default padding
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Date:",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                    const Text(
                      "Sat, Feb 22, 01:34 pm",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Trip Details",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      tripInfoRow("Pickup",
                          "92A, Dr. Jaganathan Nagar,\nVidhya Nagar, Coimbatore,\nTamil Nadu 641014, India"),
                      tripInfoRow("Drop", "Singanallur Bus Stand"),
                      Divider(),
                      tripInfoRow("Total Payable", "₹0.00"),
                      tripInfoRow("Payment", "Cash"),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "How was your trip?",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors
                            .black87, // Slightly darker text for better contrast
                      ),
                    ),
                    SizedBox(height: 8), // Adds spacing between texts
                    Text(
                      "Your feedback will help us improve the driving \n"
                      "experience better.",
                      textAlign:
                          TextAlign.center, // Fixes the missing comma issue
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors
                            .black54, // Lighter text color for readability
                        height:
                            1.5, // Increases line spacing for better readability
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              feedbackButtons(),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white, // Background color for contrast
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Your feedback (optional)',
                    hintStyle: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.indigo, width: 2),
                    ),
                  ),
                  maxLines: 3, // Adjusts the height of the text field
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Back Home Button
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        backhome = true;
                        dell = false; // Reset the other button
                        Get.find<DashBoardController>().screenType.value = "";

                        Get.offAllNamed(RouteHelper.dashboardscreen);
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 150, // Fixed width to avoid layout issues in Row
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(width: 2),
                        color: backhome
                            ? Colors.indigo
                            : Colors.white, // Default white, selected indigo
                      ),
                      child: Text(
                        "Back to Home",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: backhome
                              ? Colors.white
                              : Colors.black, // Text changes based on selection
                        ),
                      ),
                    ),
                  ),

                  // Okay Button
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        dell = true;
                        backhome = false; // Reset the other button
                        Get.find<DashBoardController>().screenType.value = "";

                        Get.offAllNamed(RouteHelper.dashboardscreen);
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 150, // Fixed width to avoid layout issues in Row
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(width: 2),
                        color: dell
                            ? Colors.indigo
                            : Colors.white, // Default indigo, selected white
                      ),
                      child: Text(
                        "Okay",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: dell
                              ? Colors.white
                              : Colors.black, // Text changes based on selection
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget tripInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: const TextStyle(fontSize: 14, color: Colors.black)),
          Text(value,
              style:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget feedbackButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: feedbackEmojis.entries.map((entry) {
        return feedbackButton(entry.key, entry.value);
      }).toList(),
    );
  }

  Widget feedbackButton(String feedbackType, IconData emojiIcon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFeedback = feedbackType; // Set the selected emoji
        });
      },
      child: Column(
        children: [
          Icon(
            emojiIcon,
            color:
                selectedFeedback == feedbackType ? Colors.orange : Colors.grey,
            size: 50,
          ),
          Text(
            feedbackType.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: selectedFeedback == feedbackType
                  ? Colors.orange
                  : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
