// animated_card.dart
import 'package:flutter/material.dart';

class ServiceCard extends StatefulWidget {
  final Widget child;
  final bool isVisible;
  final Duration delay;

  const ServiceCard({
    required this.child,
    required this.isVisible,
    required this.delay,
    super.key,
  });

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slide;
  late Animation<double> _fade;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _slide = Tween<Offset>(
      begin: Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  }

  @override
  void didUpdateWidget(covariant ServiceCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isVisible &&
        !_controller.isAnimating &&
        !_controller.isCompleted) {
      Future.delayed(widget.delay, () => _controller.forward());
    }
  }

  @override
  void dispose() {
    super.dispose();
    return _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slide,
      child: FadeTransition(opacity: _fade, child: widget.child),
    );
  }
}
