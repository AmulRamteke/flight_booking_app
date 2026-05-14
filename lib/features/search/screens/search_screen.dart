import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../providers/search_provider.dart';
import '../models/airport_model.dart';
import '../../../../core/widgets/ticket_clipper.dart';
import 'dart:math' as math;

class FlightSearchScreen extends ConsumerStatefulWidget {
  const FlightSearchScreen({super.key});

  @override
  ConsumerState<FlightSearchScreen> createState() => _FlightSearchScreenState();
}

class _FlightSearchScreenState extends ConsumerState<FlightSearchScreen> {
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _passengersController = TextEditingController(
    text: '1 Passenger',
  );

  DateTime _selectedDate = DateTime.now();
  int _passengers = 1;
  String? _fromCode;
  String? _toCode;
  final ScrollController _savedTripsController = ScrollController();
  double _scrollProgress = 0.0;

  @override
  void initState() {
    super.initState();
    _dateController.text = DateFormat('EEE, d MMM yyyy').format(_selectedDate);
    _savedTripsController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _savedTripsController.dispose();
    _fromController.dispose();
    _toController.dispose();
    _dateController.dispose();
    _passengersController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_savedTripsController.hasClients) {
      final maxScroll = _savedTripsController.position.maxScrollExtent;
      final currentScroll = _savedTripsController.position.pixels;
      setState(() {
        _scrollProgress = maxScroll > 0
            ? (currentScroll / maxScroll).clamp(0.0, 1.0)
            : 0.0;
      });
    }
  }

  void _onSearch() {
    if (_fromCode == null || _toCode == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select both airports'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    context.pushNamed(
      'flights',
      extra: {
        'from': _fromCode,
        'to': _toCode,
        'date': DateFormat('yyyy-MM-dd').format(_selectedDate),
        'passengers': _passengers,
      },
    );
  }

  void _swapAirports() {
    setState(() {
      final tempText = _fromController.text;
      final tempCode = _fromCode;
      _fromController.text = _toController.text;
      _fromCode = _toCode;
      _toController.text = tempText;
      _toCode = tempCode;
    });
  }

  Future<void> _selectDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (date != null) {
      setState(() {
        _selectedDate = date;
        _dateController.text = DateFormat('EEE, d MMM yyyy').format(date);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.from(
        alpha: 1,
        red: 0.961,
        green: 0.941,
        blue: 0.941,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header with Gradient and Profile - Original colors restored
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color.fromARGB(255, 23, 78, 181).withOpacity(0.8),
                    const Color.fromARGB(255, 56, 126, 238).withOpacity(0.5),
                    const Color.from(
                      alpha: 1,
                      red: 0.961,
                      green: 0.941,
                      blue: 0.941,
                    ),
                  ],
                  stops: const [0.0, 0.4, 0.6],
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Plan your trip',
                            style: GoogleFonts.outfit(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                              image: const DecorationImage(
                                image: NetworkImage(
                                  'https://i.pravatar.cc/150?u=a042581f4e29026704d',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      // Search Card
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(32),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 40,
                              offset: const Offset(0, 12),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 72.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _buildAirportField(
                                        label: 'From',
                                        value: _fromController.text.isEmpty
                                            ? 'Jakarta (CGK)'
                                            : _fromController.text,
                                        onTap: () =>
                                            _showAirportPicker(isFrom: true),
                                      ),
                                      Divider(
                                        height: 1,
                                        color: Colors.grey.withOpacity(0.2),
                                      ),
                                      _buildAirportField(
                                        label: 'To',
                                        value: _toController.text.isEmpty
                                            ? 'Tokyo (NRT)'
                                            : _toController.text,
                                        onTap: () =>
                                            _showAirportPicker(isFrom: false),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  right: 16,
                                  child: GestureDetector(
                                    onTap: _swapAirports,
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(
                                              0.1,
                                            ),
                                            blurRadius: 10,
                                            offset: const Offset(0, 4),
                                          ),
                                        ],
                                      ),
                                      child: const Icon(
                                        Icons.swap_vert,
                                        color: Color(0xFF4A4A4A),
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              height: 1,
                              color: Colors.grey.withOpacity(0.2),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: _buildInfoField(
                                    label: 'Departure',
                                    value: DateFormat(
                                      'EEE, d MMM',
                                    ).format(_selectedDate),
                                    icon: Icons.calendar_month_outlined,
                                    onTap: _selectDate,
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  height: 40,
                                  color: Colors.grey.withOpacity(0.2),
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                ),
                                Expanded(
                                  child: _buildInfoField(
                                    label: 'Amount',
                                    value: '$_passengers people',
                                    icon: Icons.keyboard_arrow_down,
                                    onTap: _showPassengerPicker,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Divider(
                              height: 1,
                              color: Colors.grey.withOpacity(0.2),
                            ),
                            const SizedBox(height: 24),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 0,
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: _onSearch,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 15,
                                    ),
                                    elevation: 0,
                                  ),
                                  child: Text(
                                    'Search flights',
                                    style: GoogleFonts.plusJakartaSans(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: -0.2,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                      // const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),

            // Saved Trips Section
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Saved trips',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'See more',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SingleChildScrollView(
                    controller: _savedTripsController,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildSavedTripCard(
                          'Citilink',
                          'CGK (Jakarta)',
                          'NRT (Tokyo)',
                          '7h 15m',
                          'Jan 20, 2025',
                          fromTime: '07:47',
                          toTime: '14:30',
                          showBothDates: true,
                        ),
                        const SizedBox(width: 16),
                        _buildSavedTripCard(
                          'Citilink',
                          'CGK (Jakarta)',
                          'NRT (Tokyo)',
                          '7h 15m',
                          'Jan 20, 2025',
                          fromTime: '07:47',
                          toTime: '14:30',
                          showBothDates: true,
                        ),
                        const SizedBox(width: 16),
                        _buildSavedTripCard(
                          'Citilink',
                          'CGK (Jakarta)',
                          'NRT (Tokyo)',
                          '7h 15m',
                          'Jan 20, 2024',
                          fromTime: '07:47',
                          toTime: '14:30',
                          showBothDates: true,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Custom Scroll Progress Indicator
                  Center(
                    child: Container(
                      width: 100,
                      height: 3,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: _scrollProgress * 60,
                            child: Container(
                              width: 40,
                              height: 3,
                              decoration: BoxDecoration(
                                color: const Color(0xFF2196F3),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildAirportField({
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 10.0,
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 12,
                color: const Color(0xFF8E8E93),
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              value,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF1C1C1E),
                letterSpacing: -0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoField({
    required String label,
    required String value,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 12,
                color: const Color(0xFF8E8E93),
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Expanded(
                  child: Text(
                    value,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF1C1C1E),
                      letterSpacing: -0.5,
                    ),
                  ),
                ),
                Icon(icon, size: 24, color: const Color(0xFF1C1C1E)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSavedTripCard(
    String airline,
    String from,
    String to,
    String duration,
    String date, {
    required String fromTime,
    required String toTime,
    bool showBothDates = false,
  }) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(32),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: ClipPath(
          clipper: TicketClipper(punchRadius: 12, punchPosition: 0.52),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                // Airline Header
                Center(
                  child: Text(
                    airline,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF2E7D32),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                // const SizedBox(height: 20),
                // Flight Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // From
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            fromTime,
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF1976D2),
                            ),
                          ),
                          const SizedBox(height: 4),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: from.split(' ')[0],
                                  style: GoogleFonts.plusJakartaSans(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const TextSpan(text: ' '),
                                TextSpan(
                                  text: from.contains('(')
                                      ? from.substring(from.indexOf('('))
                                      : '',
                                  style: GoogleFonts.plusJakartaSans(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Airplane Icon with Arc
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
                        const SizedBox(height: 4),
                        Text(
                          duration,
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    // To
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            toTime,
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF1976D2),
                            ),
                          ),
                          const SizedBox(height: 4),
                          RichText(
                            textAlign: TextAlign.end,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: to.split(' ')[0],
                                  style: GoogleFonts.plusJakartaSans(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const TextSpan(text: ' '),
                                TextSpan(
                                  text: to.contains('(')
                                      ? to.substring(to.indexOf('('))
                                      : '',
                                  style: GoogleFonts.plusJakartaSans(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // Dashed Line
                Row(
                  children: List.generate(
                    30,
                    (index) => Expanded(
                      child: Container(
                        height: 1,
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        color: Colors.grey.withOpacity(0.2),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Date Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'DATE',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          date,
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'DATE',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          date,
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: AppTheme.primaryColor,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 0,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ''),
        BottomNavigationBarItem(
          icon: Icon(Icons.airplanemode_active),
          label: '',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
      ],
    );
  }

  void _showAirportPicker({required bool isFrom}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      useSafeArea: true,
      builder: (context) => AirportPickerSheet(
        isFrom: isFrom,
        onSelected: (airport) {
          setState(() {
            if (isFrom) {
              _fromController.text = '${airport.city} (${airport.code})';
              _fromCode = airport.code;
            } else {
              _toController.text = '${airport.city} (${airport.code})';
              _toCode = airport.code;
            }
          });
          Navigator.pop(context);
        },
      ),
    );
  }

  void _showPassengerPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Passengers',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Adults',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: _passengers > 1
                            ? () => setModalState(() => _passengers--)
                            : null,
                        icon: const Icon(Icons.remove_circle_outline),
                      ),
                      Text(
                        '$_passengers',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () => setModalState(() => _passengers++),
                        icon: const Icon(Icons.add_circle_outline),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Center(child: Text('Confirm')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AirportPickerSheet extends ConsumerStatefulWidget {
  final bool isFrom;
  final Function(Airport) onSelected;

  const AirportPickerSheet({
    super.key,
    required this.isFrom,
    required this.onSelected,
  });

  @override
  ConsumerState<AirportPickerSheet> createState() => _AirportPickerSheetState();
}

class _AirportPickerSheetState extends ConsumerState<AirportPickerSheet> {
  final TextEditingController _searchController = TextEditingController();
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final airportsAsync = ref.watch(
      airportSearchProvider((query: _query, isFrom: widget.isFrom)),
    );

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search Airport',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onChanged: (v) => setState(() => _query = v),
            ),
          ),
          Expanded(
            child: airportsAsync.when(
              data: (airports) => ListView.builder(
                itemCount: airports.length,
                itemBuilder: (context, index) {
                  final airport = airports[index];
                  return ListTile(
                    title: Text(airport.city),
                    subtitle: Text(airport.name),
                    trailing: Text(
                      airport.code,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onTap: () => widget.onSelected(airport),
                  );
                },
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, _) => Center(child: Text(err.toString())),
            ),
          ),
        ],
      ),
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
