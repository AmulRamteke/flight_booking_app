import 'package:flutter/material.dart';

class PlaneAnimation extends StatefulWidget {
  final double size;
  final Color color;
  final Duration duration;

  const PlaneAnimation({
    super.key,
    this.size = 40,
    this.color = Colors.white,
    this.duration = const Duration(seconds: 4),
  });

  @override
  State<PlaneAnimation> createState() => _PlaneAnimationState();
}

class _PlaneAnimationState extends State<PlaneAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: -0.2, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(
            MediaQuery.of(context).size.width * _animation.value,
            10 * (1.0 - (_animation.value - 0.5).abs() * 2), // Slight wave
          ),
          child: Transform.rotate(
            angle: 0.1 * (0.5 - _animation.value),
            child: Icon(
              Icons.flight,
              color: widget.color.withOpacity(0.3),
              size: widget.size,
            ),
          ),
        );
      },
    );
  }
}

class AnimatedPlanePath extends StatefulWidget {
  final Offset start;
  final Offset end;
  final Widget plane;

  const AnimatedPlanePath({
    super.key,
    required this.start,
    required this.end,
    required this.plane,
  });

  @override
  State<AnimatedPlanePath> createState() => _AnimatedPlanePathState();
}

class _AnimatedPlanePathState extends State<AnimatedPlanePath> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: false);

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOutQuad);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final currentPos = Offset.lerp(widget.start, widget.end, _animation.value)!;
        return Positioned(
          left: currentPos.dx,
          top: currentPos.dy,
          child: widget.plane,
        );
      },
    );
  }
}
