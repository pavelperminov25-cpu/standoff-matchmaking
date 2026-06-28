import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class PlayButton extends StatefulWidget {
  final bool isSearching;
  final VoidCallback onPressed;
  const PlayButton({super.key, required this.isSearching, required this.onPressed});

  @override
  State<PlayButton> createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));
    if (widget.isSearching) _pulseController.repeat();
  }

  @override
  void dispose() { _pulseController.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _pulseController,
      builder: (context, child) {
        return Transform.scale(scale: widget.isSearching ? 1.0 + (_pulseController.value * 0.05) : 1.0, child: child);
      },
      child: Container(
        width: double.infinity, height: 70,
        decoration: BoxDecoration(gradient: const LinearGradient(colors: AppColors.neonPurpleGradient), borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: AppColors.primaryPurple.withOpacity(widget.isSearching ? 0.8 : 0.5), blurRadius: widget.isSearching ? 30 : 20, spreadRadius: widget.isSearching ? 5 : 2)]),
        child: Material(color: Colors.transparent, child: InkWell(onTap: widget.isSearching ? null : widget.onPressed, borderRadius: BorderRadius.circular(20), child: Center(child: Text(widget.isSearching ? 'SEARCHING...' : 'PLAY', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 3))))),
      ),
    );
  }
}
