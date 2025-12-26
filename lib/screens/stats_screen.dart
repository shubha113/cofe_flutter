import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../utils/constants.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Stats',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildPeriodSelector(),
          const SizedBox(height: 20),
          _buildSummaryCard(),
          const SizedBox(height: 24),
          _buildWaveChart(),
          const SizedBox(height: 24),
          _buildDevicesSection(),
        ],
      ),
    );
  }

  // Period Selector
  Widget _buildPeriodSelector() {
    final periods = ['Day', 'Week', 'Month', 'Year'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: periods.map((p) {
        final isSelected = p == 'Month';
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: isSelected
                ? AppConstants.primaryRed
                : AppConstants.secondaryRed,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            p,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      }).toList(),
    );
  }

  // Summary Card
  Widget _buildSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppConstants.secondaryRed,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Summary for December 2025',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _miniStatCard(
                  icon: Icons.bolt,
                  value: '2500',
                  label: 'kWh used',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _miniStatCard(
                  icon: Icons.currency_rupee,
                  value: '850',
                  label: 'Rs spent',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _miniStatCard({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppConstants.primaryRed,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF8E0E01),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 22),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Wave Chart
  Widget _buildWaveChart() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: SizedBox(
        height: 220,
        child: LineChart(
          LineChartData(
            gridData: FlGridData(show: false),
            borderData: FlBorderData(show: false),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 32,
                  getTitlesWidget: (value, meta) {
                    const months = ['Sep', 'Oct', 'Nov', 'Dec'];
                    if (value.toInt() >= 0 && value.toInt() < months.length) {
                      return Text(months[value.toInt()]);
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 40,
                ),
              ),
              topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),
            minX: 0,
            maxX: 3,
            minY: 0,
            maxY: 250, // adjust according to your highest y value
            lineBarsData: [
              LineChartBarData(
                spots: const [
                  FlSpot(0, 120),
                  FlSpot(1, 180),
                  FlSpot(2, 150),
                  FlSpot(3, 220),
                ],
                isCurved: true,
                barWidth: 3,
                color: AppConstants.primaryRed,
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(
                  show: true,
                  color: AppConstants.primaryRed.withOpacity(0.15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  // Devices Section
  Widget _buildDevicesSection() {
    final devices = [
      {'name': 'AC', 'location': 'Living Room'},
      {'name': 'Smart TV', 'location': 'Bedroom'},
      {'name': 'Washing Machine', 'location': 'Utility'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Devices',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Text('December'),
                SizedBox(width: 4),
                Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...devices.map((d) {
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      d['name']!,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      d['location']!,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Text(
                  '250 kWh',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          );
        }).toList(),
      ],
    );
  }
}
