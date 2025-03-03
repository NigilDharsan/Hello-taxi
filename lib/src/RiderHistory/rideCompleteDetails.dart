import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellotaxi/utils/images.dart';

class RideCompleteDetails extends StatefulWidget {
  const RideCompleteDetails({super.key});

  @override
  State<RideCompleteDetails> createState() => _RideCompleteDetailsState();
}

class _RideCompleteDetailsState extends State<RideCompleteDetails> {
  bool isLoading = false;

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Color.lerp(Colors.indigo[700]!, Colors.indigo[800]!, 0.5),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Sat, Feb 22, 01:32 pm',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Arial',
              ),
            ),
            SizedBox(height: 2),
            Text(
              'HT250222487414',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.white70,
                fontFamily: 'Arial',
              ),
            ),
          ],
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.indigo),
              ),
            )
          : SingleChildScrollView(
              child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Stack(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            Images.user,
                            width: 60,
                            height: 60,
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'HTD10009',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 4.0),
                              Text(
                                'TN57 HJ 6789',
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Positioned(
                        top: 1,
                        right: 10,
                        child: GestureDetector(
                          onTap: () {},
                          child: Row(
                            mainAxisSize: MainAxisSize.min, // Keeps it compact
                            children: const [
                              Text(
                                'Completed',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                  width: 5), // Spacing between text and icon
                              Icon(
                                Icons.check_circle, // ✅ Tick inside a circle
                                color: Colors.green,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 1.0, // Slight shadow for better UI
                    color: Colors.white, // Change this to any color you prefer
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _buildInfoCard(Images.money, '₹150.00'),
                          SizedBox(width: 30),
                          _buildInfoCard(Images.navigation, '10 km'),
                          SizedBox(width: 30),
                          _buildInfoCard(Images.clock, '20 mins'),
                        ],
                      ),
                    ),
                  ),
                  const Divider(),
                  const Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.red),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '91, Civil Aerodrome Post, Opp, CMC, \n'
                              'Dr. Jaganathan Nagar, Coimbatore,\n'
                              'Tamil Nadu 641014, India',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 1),
                  Padding(
                    padding: const EdgeInsets.all(13),
                    child: CustomPaint(
                      size: const Size(1, 25),
                      painter: DottedLinePainter(),
                    ),
                  ),
                  const Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.green),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Singanallur Bus stand',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  const Text(
                    'Payment Details',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total Payable',
                          style: TextStyle(fontSize: 15)),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "₹0.00",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  const Text(
                    'Rating',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: List.generate(
                      5,
                      (index) => Icon(
                        Icons.star,
                        color: index < 3 ? Colors.indigo : Colors.grey,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            )),
    );
  }
}

Widget _buildInfoCard(String imagePath, String text) {
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Image.asset(imagePath, width: 30, height: 30),
            const SizedBox(height: 5),
            Text(
              text,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    ),
  );
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.indigo
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    double dashHeight = 5, dashSpace = 3, startY = 0;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
