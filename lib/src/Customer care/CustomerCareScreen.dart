import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellotaxi/utils/images.dart';
import 'package:hellotaxi/utils/styles.dart';

class CustomerCareScreen extends StatefulWidget {
  const CustomerCareScreen({super.key});

  @override
  State<CustomerCareScreen> createState() => _CustomerCareScreenState();
}

class _CustomerCareScreenState extends State<CustomerCareScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          "Customer Care",
          style: ubuntuBold,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width:
                    double.infinity, // Set width same as height for centering
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Images.customer_care),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "We're here to help!",
                style: nameBold,
              ),
              const SizedBox(height: 10),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      // color: Colors.white70, // Border color
                      width: 1, // Border width
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text(
                        'For Support Team',
                        style: nameBold,
                      ),
                      SizedBox(height: 10),
                      Text(
                        '📞 Call Us: \n0422 2000009',
                        style: colorBold,
                      ),
                      SizedBox(height: 5),
                      Text(
                        '📧 Email Us: \nhollywoodfleets@gmail.com',
                        style: colorBold,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Frequently Asked Questions (FAQs)",
                style: nameBold,
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  _faqTile('1. How do I book a ride?'),
                  _faqTile('2. What types of vehicles are available?'),
                  _faqTile('3. Can I schedule a ride in advance?'),
                  _faqTile('4. How do I rate my driver?'),
                  _faqTile('5. How do I report an issue?'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // FAQ Tile Widget
  Widget _faqTile(String question) {
    return ListTile(
      title: Text(
        question,
        style: normalBold,
      ),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black87,size: 25,),
    );
  }
}
