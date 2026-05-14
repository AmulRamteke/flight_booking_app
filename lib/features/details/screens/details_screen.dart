import 'package:barcode_widget/barcode_widget.dart';
import 'package:flight_booking_app/features/search/models/flight_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/ticket_clipper.dart';
import '../providers/details_provider.dart';
import 'dart:math' as math;
import 'package:google_fonts/google_fonts.dart';

class FlightDetailsScreen extends ConsumerWidget {
  final String flightId;
  final int passengers;
  final String date;
  const FlightDetailsScreen({
    super.key,
    required this.flightId,
    this.passengers = 1,
    this.date = '',
  });
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

    // Handle relative paths from the APIx
    return 'https://flight.wigian.in/${providedUrl.startsWith('/') ? providedUrl.substring(1) : providedUrl}';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flightAsync = ref.watch(
      flightDetailsProvider((flightId: flightId, passengers: passengers)),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF2F5F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: IconButton(
            icon: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade100),
              ),
              child: const Icon(Icons.arrow_back_ios_new, size: 16),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Your flight details',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      body: flightAsync.when(
        data: (flight) {
          final logoUrl = _getAirlineLogo(
            flight.airlineName,
            flight.airlineLogo,
          );
          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                // Ticket 1: Flight Info
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(32),
                    child: ClipPath(
                      clipper: TicketClipper(
                        punchRadius: 12,
                        punchPosition: 0.68,
                      ),
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 48,
                                  height: 48,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFE8F5E9),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: ClipOval(
                                      child: logoUrl.isNotEmpty
                                          ? Image.network(
                                              logoUrl,
                                              width: 32,
                                              height: 32,
                                              fit: BoxFit.contain,
                                              errorBuilder: (c, e, s) =>
                                                  const Icon(
                                                    Icons.airplanemode_active,
                                                    size: 24,
                                                    color: Color(0xFF2E7D32),
                                                  ),
                                            )
                                          : const Icon(
                                              Icons.airplanemode_active,
                                              size: 24,
                                              color: Color(0xFF2E7D32),
                                            ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  flight.airlineName,
                                  style: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  flight.flightNumber,
                                  style: GoogleFonts.plusJakartaSans(
                                    color: const Color(0xFFA0A0A0),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 32),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildTimeInfo(
                                  flight.departure.time,
                                  flight.departure.airportCode,
                                  flight.departure.city,
                                  CrossAxisAlignment.start,
                                ),
                                Column(
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
                                    const SizedBox(height: 6),
                                    Text(
                                      flight.duration,
                                      style: GoogleFonts.plusJakartaSans(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                _buildTimeInfo(
                                  flight.arrival.time,
                                  flight.arrival.airportCode,
                                  flight.arrival.city,
                                  CrossAxisAlignment.end,
                                ),
                              ],
                            ),
                            const SizedBox(height: 32),
                            Row(
                              children: List.generate(
                                40,
                                (index) => Expanded(
                                  child: Container(
                                    height: 1.5,
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 2,
                                    ),
                                    color: Colors.grey.withOpacity(0.2),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildDetailItem(
                                  'TERMINAL',
                                  flight.terminal ?? '2A',
                                ),
                                _buildDetailItem('GATE', flight.gate ?? '19'),
                                _buildDetailItem(
                                  'Class',
                                  flight.flightClass ?? 'Economy',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Ticket 2: Passengers & Barcode
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(32),
                    child: ClipPath(
                      clipper: TicketClipper(
                        punchRadius: 12,
                        punchPosition: 0.72,
                      ),
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Passengers Info',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 24),
                            if (flight.passengers != null &&
                                flight.passengers!.isNotEmpty)
                              ...flight.passengers!.map(
                                (p) => Column(
                                  children: [
                                    _buildPassengerItem(
                                      'PASSENGER ${p.passengerNumber}',
                                      '${p.title} ${p.name}',
                                      p.seat,
                                      p.profilePicture ??
                                          'https://i.pravatar.cc/150?u=${p.passengerNumber}',
                                    ),
                                    const SizedBox(height: 12),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 60.0,
                                      ),
                                      child: Divider(
                                        color: Colors.grey.withOpacity(0.1),
                                        height: 1,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                  ],
                                ),
                              )
                            else ...[
                              _buildPassengerItem(
                                'PASSENGER 1',
                                'Mr. Budiarti Rohman',
                                '3A',
                                'https://i.pravatar.cc/150?u=1',
                              ),
                              const SizedBox(height: 12),
                              Padding(
                                padding: const EdgeInsets.only(left: 60.0),
                                child: Divider(
                                  color: Colors.grey.withOpacity(0.1),
                                  height: 1,
                                ),
                              ),
                              const SizedBox(height: 12),
                              _buildPassengerItem(
                                'PASSENGER 2',
                                'Mrs. Samantha William',
                                '3B',
                                'https://i.pravatar.cc/150?u=2',
                              ),
                            ],
                            const SizedBox(height: 32),
                            Row(
                              children: List.generate(
                                40,
                                (index) => Expanded(
                                  child: Container(
                                    height: 1.5,
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 2,
                                    ),
                                    color: Colors.grey.withOpacity(0.2),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 32),
                            Center(
                              child: BarcodeWidget(
                                barcode: Barcode.code128(),
                                data: 'BOARDINGPASS-12345',
                                width: double.infinity,
                                height: 80,
                                drawText: false,
                              ),
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 64),
                    shape: const StadiumBorder(),
                    elevation: 0,
                  ),
                  child: Text(
                    'Download & Save pass',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text(err.toString())),
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
            fontSize: 14,
            color: const Color(0xFF1976D2),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        RichText(
          textAlign: align == CrossAxisAlignment.start
              ? TextAlign.start
              : TextAlign.end,
          text: TextSpan(
            children: [
              TextSpan(
                text: code,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const TextSpan(text: ' '),
              TextSpan(
                text: '($city)',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  color: const Color(0xFF8E8E93),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 12,
            color: const Color(0xFFA0A0A0),
            fontWeight: FontWeight.w500,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildPassengerItem(
    String label,
    String name,
    String seat,
    String avatar,
  ) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(avatar),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 11,
                  color: const Color(0xFFA0A0A0),
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                name,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'SEAT',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 11,
                color: const Color(0xFFA0A0A0),
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              seat,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class DottedArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF1976D2).withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    const double dashWidth = 2;
    const double dashSpace = 2;
    final double radius = size.width / 2;

    const double startAngle = -math.pi;

    final rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height),
      radius: radius,
    );

    double currentAngle = 0;
    while (currentAngle < math.pi) {
      canvas.drawArc(
        rect,
        startAngle + currentAngle,
        dashWidth / radius,
        false,
        paint,
      );
      currentAngle += (dashWidth + dashSpace) / radius;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
