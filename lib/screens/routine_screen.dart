import 'package:flutter/material.dart';
import '../utils/constants.dart';

class RoutineScreen extends StatelessWidget {
  const RoutineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final routines = [
      {'title': 'WAKE UP', 'icon': Icons.wb_sunny_outlined},
      {'title': 'CLEAN', 'icon': Icons.cleaning_services_outlined},
      {'title': 'LAUNDRY', 'icon': Icons.local_laundry_service_outlined},
      {'title': 'WORK', 'icon': Icons.work_outline},
      {'title': 'SLEEP', 'icon': Icons.nightlight_outlined},
      {'title': 'GYM', 'icon': Icons.fitness_center_outlined},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Routine',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: routines.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Text(
                'Active Routines',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            );
          }

          if (index == routines.length) {
            return Center(
              child: Container(
                margin: const EdgeInsets.only(top: 8, bottom: 24),
                child: CircleAvatar(
                  radius: 28,
                  backgroundColor: AppConstants.primaryBlue,
                  child: const Icon(
                    Icons.add,
                    size: 28,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          }

          final routine = routines[index - 1];
          return _buildRoutineCard(
            icon: routine['icon'] as IconData,
            title: routine['title'] as String,
          );
        },
      ),
    );
  }

  Widget _buildRoutineCard({
    required IconData icon,
    required String title,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, size: 28),

          const SizedBox(width: 12),

          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),

          const Spacer(),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text(
                '6:00 AM',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '5 devices',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
