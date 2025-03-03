import 'package:flutter/material.dart';

class PickupPage extends StatelessWidget {
  const PickupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Pickup',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
          ),
          const SizedBox(height: 5),
          const Text(
            'Enter the pickup location',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 20),
              Expanded(
                child: CustomPaint(
                  size: const Size(double.infinity, 2), // Full width
                  painter: DottedPainter(isHorizontal: true), // Pass required parameter
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 10),
              Column(
                children: [
                  CustomPaint(
                    size: const Size(2, 35),
                    painter: DottedLinePainter(isHorizontal: false),
                  ),
                ],
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
        canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
        startX += dashWidth + dashSpace;
      }
    } else {
      while (startY < size.height) {
        canvas.drawLine(Offset(0, startY), Offset(0, startY + dashWidth), paint);
        startY += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// Vertical Dotted Line Painter (Alternative for clarity)
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
