import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class QueueList extends StatelessWidget {
  final List<Map<String, dynamic>> players;
  const QueueList({super.key, required this.players});

  Color _getStatusColor(String status) {
    switch (status) {
      case 'online': return AppColors.queueOnline;
      case 'ingame': return AppColors.queueInGame;
      default: return AppColors.queueOffline;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: AppColors.backgroundCard, borderRadius: BorderRadius.circular(16), border: Border.all(color: AppColors.primaryPurple.withOpacity(0.3))), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('QUEUE', style: TextStyle(fontSize: 12, color: AppColors.textMuted, fontWeight: FontWeight.bold, letterSpacing: 2)), const SizedBox(height: 12), ...players.map((player) => _buildQueueItem(player)).toList()]));
  }

  Widget _buildQueueItem(Map<String, dynamic> player) {
    return Container(margin: const EdgeInsets.only(bottom: 8), padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10), decoration: BoxDecoration(color: AppColors.backgroundElevated, borderRadius: BorderRadius.circular(10), border: Border.all(color: AppColors.primaryPurple.withOpacity(0.2))), child: Row(children: [Container(width: 8, height: 8, decoration: BoxDecoration(color: _getStatusColor(player['status']), shape: BoxShape.circle)), const SizedBox(width: 12), Expanded(child: Text(player['name'], style: const TextStyle(fontSize: 14, color: AppColors.textPrimary, fontWeight: FontWeight.w500))), Text('${player['mmr']}', style: const TextStyle(fontSize: 12, color: AppColors.secondaryPurple, fontWeight: FontWeight.bold))]));
  }
}
