import 'package:flight_booking_app/features/details/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/ticket_clipper.dart';
import '../models/flight_model.dart';

class FlightCard extends StatelessWidget {
  final Flight flight;
  final VoidCallback onTap;

  const FlightCard({super.key, required this.flight, required this.onTap});

  String _getAirlineLogo(String airlineName, String providedUrl) {
    if (providedUrl.isEmpty) {
      final name = airlineName.toLowerCase();
      if (name.contains('air india') || name.contains('airindia')) {
        return 'https://logo.clearbit.com/airindia.in';
      } else if (name.contains('indigo')) {
        return 'https://logo.clearbit.com/goindigo.in';
      } else if (name.contains('spicejet') || name.contains('spice jet')) {
        return 'https://logo.clearbit.com/spicejet.com';
      } else if (name.contains('vistara')) {
        return 'https://logo.clearbit.com/airvistara.com';
      } else if (name.contains('air asia') || name.contains('airasia')) {
        return 'https://logo.clearbit.com/airasia.com';
      }
      return '';
    }

    if (providedUrl.startsWith('http')) {
      return providedUrl;
    }

    // Handle relative paths from the API
    return 'https://flight.wigian.in/${providedUrl.startsWith('/') ? providedUrl.substring(1) : providedUrl}';
  }

  @override
  Widget build(BuildContext context) {
    final logoUrl = _getAirlineLogo(flight.airlineName, flight.airlineLogo);

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Stack(
        children: [
          ClipPath(
            clipper: TicketClipper(punchRadius: 10, punchPosition: 0.65),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onTap,
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Color(0xFFE8F5E9),
                                shape: BoxShape.circle,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: logoUrl.isNotEmpty
                                    ? Image.network(
                                        logoUrl,
                                        fit: BoxFit.contain,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                const Icon(
                                                  Icons.airplanemode_active,
                                                  size: 20,
                                                  color: Colors.green,
                                                ),
                                      )
                                    : const Icon(
                                        Icons.airplanemode_active,
                                        size: 20,
                                        color: Colors.green,
                                      ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              flight.airlineName,
                              style: GoogleFonts.plusJakartaSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: const Color(0xFF1C1C1E),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildTimeInfo(
                              flight.departure.time,
                              flight.departure.airportCode,
                              flight.departure.city,
                              CrossAxisAlignment.start,
                            ),
                            const Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: FlightPathWidget(duration: '7h 15m'),
                              ),
                            ),
                            _buildTimeInfo(
                              flight.arrival.time,
                              flight.arrival.airportCode,
                              flight.arrival.city,
                              CrossAxisAlignment.end,
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        // Dotted Line Separator
                        CustomPaint(
                          size: const Size(double.infinity, 1),
                          painter: DashLinePainter(
                            color: Colors.grey.withOpacity(0.2),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${flight.price.currency}${flight.price.amount.toInt()}',
                                  style: GoogleFonts.plusJakartaSans(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF2E6FF1),
                                  ),
                                ),
                                Text(
                                  '/person',
                                  style: GoogleFonts.plusJakartaSans(
                                    color: const Color(0xFF8E8E93),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: onTap,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white,
                                minimumSize: const Size(140, 48),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                              child: Text(
                                'Select flight',
                                style: GoogleFonts.plusJakartaSans(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeInfo(
    String time,
    String code,
    String city,
    CrossAxisAlignment align,
  ) {
    return Column(
      crossAxisAlignment: align,
      children: [
        Text(
          time,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 12,
            color: const Color(0xFF2E6FF1),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              code,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1C1C1E),
              ),
            ),
            const SizedBox(width: 4),
            Text(
              '($city)',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 12,
                color: const Color(0xFF8E8E93),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class FlightPathWidget extends StatelessWidget {
  final String duration;
  const FlightPathWidget({super.key, required this.duration});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 50,
                height: 25,
                child: CustomPaint(
                  painter: DottedArcPainter(),
                  child: const Center(
                    child: Icon(
                      Icons.flight_takeoff_sharp,
                      size: 18,
                      color: Color(0xFF1976D2),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          duration,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF1C1C1E),
          ),
        ),
      ],
    );
  }
}

class CurvedDashPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF2E6FF1).withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final path = Path();
    path.moveTo(0, size.height);
    path.quadraticBezierTo(
      size.width / 2,
      -size.height * 0.5,
      size.width,
      size.height,
    );

    final dashPath = Path();
    double dashWidth = 3;
    double dashSpace = 3;
    double distance = 0;

    for (var i = 0; i < 100; i++) {
      final metric = path.computeMetrics().first;
      if (distance < metric.length) {
        dashPath.addPath(
          metric.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth + dashSpace;
      }
    }
    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class DashLinePainter extends CustomPainter {
  final Color color;
  DashLinePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 3, dashSpace = 2, startX = 0;
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
