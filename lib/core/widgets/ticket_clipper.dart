import 'package:flutter/material.dart';
class TicketClipper extends CustomClipper<Path> {
  final double punchRadius;
  final double punchPosition; 
  TicketClipper({
    this.punchRadius = 10,
    this.punchPosition = 0.7,
  });
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * punchPosition - punchRadius);
    path.arcToPoint(
      Offset(0, size.height * punchPosition + punchRadius),
      radius: Radius.circular(punchRadius),
      clockwise: true,
    );
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * punchPosition + punchRadius);
    path.arcToPoint(
      Offset(size.width, size.height * punchPosition - punchRadius),
      radius: Radius.circular(punchRadius),
      clockwise: true,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
