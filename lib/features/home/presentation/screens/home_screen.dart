import 'package:flutter/material.dart';
import 'dart:math' show Random;
import '../../../../core/constants/app_colors.dart';
import '../../../../shared/widgets/glass_card.dart';
import '../widgets/mmr_card.dart';
import '../widgets/play_button.dart';
import '../widgets/queue_list.dart';
import '../widgets/stat_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool isSearching = false;
  
  final int mmr = 2847;
  final double winRate = 63.2;
  final double kdRatio = 2.14;
  
  final List<Map<String, dynamic>> queuePlayers = [
    {'name': 'Caao', 'mmr': 2801, 'status': 'online'},
    {'name': 'Fapy MAo', 'mmr': 2802, 'status': 'online'},
    {'name': 'Faga MAe', 'mmr': 2803, 'status': 'ingame'},
    {'name': 'Casa Muf', 'mmr': 2803, 'status': 'online'},
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() { _animationController.dispose(); super.dispose(); }

  void _toggleSearch() { setState(() { isSearching = !isSearching; }); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [AppColors.backgroundDark, AppColors.backgroundCard, AppColors.backgroundDark])),
        child: SafeArea(child: Column(children: [_buildHeader(), Expanded(child: SingleChildScrollView(padding: const EdgeInsets.all(20), child: Column(children: [MmrCard(mmr: mmr, winRate: winRate), const SizedBox(height: 24), PlayButton(isSearching: isSearching, onPressed: _toggleSearch), if (isSearching) ...[const SizedBox(height: 16), Container(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), decoration: BoxDecoration(color: AppColors.primaryPurple.withOpacity(0.2), borderRadius: BorderRadius.circular(20), border: Border.all(color: AppColors.primaryPurple.withOpacity(0.5))), child: Row(mainAxisSize: MainAxisSize.min, children: [AnimatedBuilder(animation: _animationController, builder: (context, child) => Opacity(opacity: 0.5 + (_animationController.value * 0.5), child: const Icon(Icons.search, color: AppColors.primaryPurple, size: 16))), const SizedBox(width: 8), Text('Searching... ${Random().nextInt(10) + 1} players in queue', style: const TextStyle(color: AppColors.secondaryPurple, fontSize: 12))]))], const SizedBox(height: 24), QueueList(players: queuePlayers)]))), _buildFloatingStats()])),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildHeader() {
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16), child: Row(children: [Container(width: 50, height: 50, decoration: BoxDecoration(shape: BoxShape.circle, gradient: const LinearGradient(colors: AppColors.purpleGradient), border: Border.all(color: AppColors.lightPurple, width: 2), boxShadow: [BoxShadow(color: AppColors.primaryPurple.withOpacity(0.5), blurRadius: 10, spreadRadius: 2)]), child: const CircleAvatar(backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'), radius: 23)), const SizedBox(width: 12), const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Player_7X', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary)), Text('Level 107', style: TextStyle(fontSize: 12, color: AppColors.textSecondary))]), const Spacer(), IconButton(onPressed: () {}, icon: const Icon(Icons.settings_outlined, color: AppColors.secondaryPurple))]));
  }

  Widget _buildFloatingStats() {
    return Padding(padding: const EdgeInsets.all(16), child: Row(children: [Expanded(child: GlassCard(child: StatCard(title: 'Win Rate', value: '${winRate.toStringAsFixed(1)}%', icon: Icons.trophy, color: AppColors.success))), const SizedBox(width: 12), Expanded(child: GlassCard(child: StatCard(title: 'K/D Ratio', value: kdRatio.toStringAsFixed(2), icon: Icons.sports_esports, color: AppColors.warning)))]));
  }

  Widget _buildBottomNav() {
    return Container(decoration: BoxDecoration(color: AppColors.backgroundCard, borderRadius: const BorderRadius.vertical(top: Radius.circular(20)), boxShadow: [BoxShadow(color: AppColors.primaryPurple.withOpacity(0.2), blurRadius: 20, spreadRadius: 5)]), child: BottomNavigationBar(currentIndex: 0, onTap: (index) {}, items: const [BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: 'Home'), BottomNavigationBarItem(icon: Icon(Icons.matching_outlined), activeIcon: Icon(Icons.matching), label: 'Match'), BottomNavigationBarItem(icon: Icon(Icons.bar_chart_outlined), activeIcon: Icon(Icons.bar_chart), label: 'Stats'), BottomNavigationBarItem(icon: Icon(Icons.person_outlined), activeIcon: Icon(Icons.person), label: 'Profile')]));
  }
}
