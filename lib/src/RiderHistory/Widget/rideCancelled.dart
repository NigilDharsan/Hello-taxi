import 'package:flutter/material.dart';

class RideCancelled extends StatefulWidget {
  const RideCancelled({super.key});

  @override
  State<RideCancelled> createState() => _RideCancelledState();
}

class _RideCancelledState extends State<RideCancelled> {
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
      backgroundColor: Colors.grey[300],
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.indigo),
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 0.9,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Sat, Feb 22, 1:30 pm ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Booking id: ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      'HT2502222229047 ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Divider(),
                            const Row(
                              children: [
                                Icon(Icons.location_on, color: Colors.red),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          '59,Arasamara St,Shoba Nagar \n'
                                          'Avarampalayam Illango Nagar,\n'
                                          'Coimbatore,Tamil Nadu 641006,\n'
                                          'india',
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(width: 10),
                                const Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Cancel Reason',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Column(
                                  children: [
                                    Text('Changed my plan',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.indigo
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    double dashHeight = 5, dashSpace = 1, startY = 0;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
