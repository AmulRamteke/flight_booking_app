import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/shimmer_loading.dart';
import '../../../../core/widgets/custom_button.dart';
import '../models/flight_model.dart';
import '../providers/search_provider.dart';
import '../widgets/flight_card.dart';

class FlightListingScreen extends ConsumerStatefulWidget {
  final Map<String, dynamic>? searchParams;
  const FlightListingScreen({super.key, this.searchParams});

  @override
  ConsumerState<FlightListingScreen> createState() => _FlightListingScreenState();
}

class _FlightListingScreenState extends ConsumerState<FlightListingScreen> {
  static const _pageSize = 10;
  final PagingController<int, Flight> _pagingController = PagingController(firstPageKey: 1);
  
  late Map<String, dynamic> _currentSearchParams;

  @override
  void initState() {
    super.initState();
    _currentSearchParams = Map.from(widget.searchParams ?? {});
    _currentSearchParams.putIfAbsent('sort_by', () => 'price_asc');
    _currentSearchParams.putIfAbsent('filters', () => {
      'airline': '',
      'price_min': 0,
      'price_max': 0,
      'stops': 0,
      'aircraft_type': ''
    });

    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final flights = await ref.read(flightSearchProvider(_currentSearchParams).future);
      
      final isLastPage = flights.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(flights);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(flights, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  void _applyFilters(Map<String, dynamic> newFilters, String sortBy) {
    setState(() {
      _currentSearchParams['filters'] = newFilters;
      _currentSearchParams['sort_by'] = sortBy;
      _pagingController.refresh();
    });
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9F0FF),
      body: SafeArea(
        child: Column(
          children: [
            // Custom App Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.arrow_back_ios_new, size: 20, color: Color(0xFF1C1C1E)),
                    ),
                  ),
                  Text(
                    'Flight result',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1C1C1E),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.more_vert, size: 20, color: Color(0xFF1C1C1E)),
                  ),
                ],
              ),
            ),

            // Horizontal Filter Tags
            Container(
              height: 50,
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _buildQuickFilter('Lowest to Highest', true),
                  _buildQuickFilter('Preferred airlines', false),
                  _buildQuickFilter('Flight...', false),
                ],
              ),
            ),

            // Flight List
            Expanded(
              child: PagedListView<int, Flight>(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                pagingController: _pagingController,
                builderDelegate: PagedChildBuilderDelegate<Flight>(
                  itemBuilder: (context, flight, index) => TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.0, end: 1.0),
                    duration: Duration(milliseconds: 400 + (index * 100)),
                    curve: Curves.easeOutCubic,
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(0, 50 * (1 - value)),
                        child: Opacity(
                          opacity: value,
                          child: child,
                        ),
                      );
                    },
                    child: FlightCard(
                      flight: flight,
                      onTap: () => context.pushNamed(
                        'flight-details',
                        queryParameters: {
                          'id': flight.id.toString(),
                          'passengers': _currentSearchParams['passengers']?.toString() ?? '1',
                          'date': _currentSearchParams['date']?.toString() ?? '',
                        },
                      ),
                    ),
                  ),
                  firstPageProgressIndicatorBuilder: (_) => Column(
                    children: List.generate(5, (index) => const FlightCardShimmer()),
                  ),
                  noItemsFoundIndicatorBuilder: (_) => _buildEmptyState(),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showFilterSheet,
        backgroundColor: const Color(0xFFC6DBFF),
        elevation: 0,
        shape: const CircleBorder(),
        child: const Icon(Icons.tune_rounded, color: Color(0xFF2E6FF1)),
      ),
    );
  }

  Widget _buildQuickFilter(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF2E6FF1) : Colors.white,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: isSelected ? const Color(0xFF2E6FF1) : Colors.transparent,
        ),
      ),
      child: Center(
        child: Text(
          label,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : const Color(0xFF1C1C1E),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 100),
          Icon(Icons.airplanemode_inactive_rounded, size: 80, color: Colors.grey[300]),
          const SizedBox(height: 24),
          const Text(
            'No flights found',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Try adjusting your filters or search criteria',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  void _showFilterSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => FilterBottomSheet(
        initialFilters: _currentSearchParams['filters'],
        initialSortBy: _currentSearchParams['sort_by'],
        onApply: (newFilters, sortBy) {
          _applyFilters(newFilters, sortBy);
        },
      ),
    );
  }
}

class FilterBottomSheet extends ConsumerStatefulWidget {
  final Map<String, dynamic> initialFilters;
  final String initialSortBy;
  final Function(Map<String, dynamic>, String) onApply;

  const FilterBottomSheet({
    super.key,
    required this.initialFilters,
    required this.initialSortBy,
    required this.onApply,
  });

  @override
  ConsumerState<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends ConsumerState<FilterBottomSheet> {
  late String _selectedSort;
  late int _selectedStops;
  late String _selectedAirline;
  late String _selectedAircraftType;
  late RangeValues _priceRange;
  late Map<String, dynamic> _filters;

  @override
  void initState() {
    super.initState();
    _selectedSort = widget.initialSortBy;
    _filters = Map.from(widget.initialFilters);
    _selectedStops = _filters['stops'] ?? 0;
    _selectedAirline = _filters['airline'] ?? '';
    _selectedAircraftType = _filters['aircraft_type'] ?? '';
    
    double minPrice = (_filters['price_min'] ?? 0).toDouble();
    double maxPrice = (_filters['price_max'] ?? 5000).toDouble();
    if (maxPrice == 0) maxPrice = 5000;
    _priceRange = RangeValues(minPrice, maxPrice);
  }

  @override
  Widget build(BuildContext context) {
    final airlinesAsync = ref.watch(airlinesProvider);
    final aircraftTypesAsync = ref.watch(aircraftTypesProvider);

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Sort & Filter', style: Theme.of(context).textTheme.titleLarge),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _selectedSort = 'price_asc';
                      _selectedStops = 0;
                      _selectedAirline = '';
                      _selectedAircraftType = '';
                      _priceRange = const RangeValues(0, 5000);
                    });
                  },
                  child: const Text('Reset All', style: TextStyle(color: AppTheme.errorColor)),
                ),
              ],
            ),
            const SizedBox(height: 32),
            _buildSectionTitle('Sort By'),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _buildChoiceChip('Cheapest', 'price_asc'),
                _buildChoiceChip('Fastest', 'duration_asc'),
                _buildChoiceChip('Early Departure', 'departure_asc'),
              ],
            ),
            const SizedBox(height: 32),
            _buildSectionTitle('Price Range'),
            RangeSlider(
              values: _priceRange,
              min: 0,
              max: 5000,
              divisions: 50,
              activeColor: AppTheme.accentColor,
              labels: RangeLabels(
                '\$${_priceRange.start.round()}',
                '\$${_priceRange.end.round()}',
              ),
              onChanged: (values) => setState(() => _priceRange = values),
            ),
            const SizedBox(height: 32),
            _buildSectionTitle('Stops'),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildStopButton('Non-stop', 0),
                const SizedBox(width: 12),
                _buildStopButton('1 Stop', 1),
                const SizedBox(width: 12),
                _buildStopButton('2+ Stops', 2),
              ],
            ),
            const SizedBox(height: 32),
            _buildSectionTitle('Airline'),
            const SizedBox(height: 16),
            airlinesAsync.when(
              data: (airlines) => Wrap(
                spacing: 10,
                children: [
                  _buildFilterChip('All', '', _selectedAirline),
                  ...airlines.map((a) => _buildFilterChip(a.name, a.name, _selectedAirline)),
                ],
              ),
              loading: () => const LinearProgressIndicator(),
              error: (_, __) => const Text('Error loading airlines'),
            ),
            const SizedBox(height: 32),
            _buildSectionTitle('Aircraft Type'),
            const SizedBox(height: 16),
            aircraftTypesAsync.when(
              data: (types) => Wrap(
                spacing: 10,
                children: [
                  _buildFilterChip('All', '', _selectedAircraftType),
                  ...types.map((t) => _buildFilterChip(t.name, t.name, _selectedAircraftType)),
                ],
              ),
              loading: () => const LinearProgressIndicator(),
              error: (_, __) => const Text('Error loading aircraft types'),
            ),
            const SizedBox(height: 48),
            CustomButton(
              text: 'Show Results',
              onPressed: () {
                _filters['stops'] = _selectedStops;
                _filters['airline'] = _selectedAirline;
                _filters['aircraft_type'] = _selectedAircraftType;
                _filters['price_min'] = _priceRange.start.toInt();
                _filters['price_max'] = _priceRange.end.toInt();
                widget.onApply(_filters, _selectedSort);
                Navigator.pop(context);
              },
              backgroundColor: AppTheme.primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16));
  }

  Widget _buildChoiceChip(String label, String value) {
    final isSelected = _selectedSort == value;
    return GestureDetector(
      onTap: () => setState(() => _selectedSort = value),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.accentColor : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: isSelected ? AppTheme.accentColor : Colors.grey.shade200),
          boxShadow: isSelected ? AppTheme.premiumShadow : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : AppTheme.primaryColor.withOpacity(0.6),
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, String value, String currentValue) {
    final isSelected = currentValue == value;
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          if (currentValue == _selectedAirline) {
            _selectedAirline = value;
          } else {
            _selectedAircraftType = value;
          }
        });
      },
      selectedColor: AppTheme.accentColor,
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : AppTheme.primaryColor,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }

  Widget _buildStopButton(String label, int value) {
    final isSelected = _selectedStops == value;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedStops = value),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? AppTheme.primaryColor : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: isSelected ? AppTheme.primaryColor : Colors.grey.shade200),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : AppTheme.primaryColor.withOpacity(0.6),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

