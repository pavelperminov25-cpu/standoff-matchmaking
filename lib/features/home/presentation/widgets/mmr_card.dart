import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../shared/widgets/glass_card.dart';

class MmrCard extends StatelessWidget {
  final int mmr;
  final double winRate;

  const MmrCard({super.key, required this.mmr, required this.winRate});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0x408B5CF6), Color(0x20A78BFA)],
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Text('MMR', style: TextStyle(fontSize: 14, color: AppColors.textSecondary, fontWeight: FontWeight.w600, letterSpacing: 2)),
            const SizedBox(height: 8),
            Text(mmr.toString(), style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: AppColors.textPrimary, shadows: [Shadow(color: AppColors.primaryPurple, blurRadius: 20)])),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(gradient: const LinearGradient(colors: AppColors.purpleGradient), borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: AppColors.primaryPurple.withOpacity(0.4), blurRadius: 10, spreadRadius: 2)]),
              child: Row(mainAxisSize: MainAxisSize.min, children: [const Icon(Icons.percent, color: Colors.white, size: 16), const SizedBox(width: 6), Text('Win Rate: ${winRate.toStringAsFixed(1)}%', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14))]),
            ),
          ],
        ),
      ),
    );
  }
}
