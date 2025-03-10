import 'package:flutter/material.dart';
import 'package:hellotaxi/src/Dashboard/Widget/ChooseDropAndPickup/chooseLocation.dart';
import 'package:hellotaxi/utils/styles.dart';

class DropPage extends StatelessWidget {
  const DropPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            // Aligns items properly
            children: [
              const Icon(Icons.location_on, color: Colors.black, size: 30),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Drop at....',
                      style: rupees,
                    ),
                    GestureDetector(
                      onTap: () {
                        selectLocation(context, false);
                      },
                      child: const Text(
                        'Enter the Drop location',
                        style: ubuntuSemiBold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 1),
          Row(
            children: [
              const SizedBox(width: 20),
              Expanded(
                child: CustomPaint(
                  size: const Size(double.infinity, 2), // Full width
                  painter: DottedPainter(
                      isHorizontal: true), // Pass required parameter
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DottedPainter extends CustomPainter {
  final bool isHorizontal;

  DottedPainter({required this.isHorizontal});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    double dashWidth = 5, dashSpace = 3, startX = 0, startY = 0;

    if (isHorizontal) {
      while (startX < size.width) {
        canvas.drawLine(
            Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
        startX += dashWidth + dashSpace;
      }
    } else {
      while (startY < size.height) {
        canvas.drawLine(
            Offset(0, startY), Offset(0, startY + dashWidth), paint);
        startY += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class DottedLinePainter extends CustomPainter {
  final bool isHorizontal;

  DottedLinePainter({required this.isHorizontal});

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
