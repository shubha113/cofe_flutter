import 'package:flutter/material.dart';
import '../utils/constants.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // Device states (true = ON, false = OFF)
  Map<String, bool> deviceStates = {
    'AC': true,
    'Smart TV': true,
    'Smart Bulb': false,
    'Washing Machine': true,
    'Smart Fan': false,
    'Refrigerator': true,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                _buildHeader(),
                const SizedBox(height: 24),

                // Stats Card
                _buildStatsCard(),
                const SizedBox(height: 24),

                // Quick Actions
                _buildQuickActions(),
                const SizedBox(height: 24),

                // Active Devices
                _buildActiveDevices(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Good Morning, John',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.grey[300],
          child: const Icon(Icons.person, color: Colors.grey, size: 28),
        ),
      ],
    );
  }

  Widget _buildStatsCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppConstants.primaryBlue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem(Icons.thermostat_outlined, 'Temperature', '25°C'),
          _buildStatItem(Icons.water_drop_outlined, 'Humidity', '80%'),
          _buildStatItem(Icons.flash_on_outlined, 'Energy Used', '250 kWh'),
        ],
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 32),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActions() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Quick Action',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              'Edit',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildQuickActionCard(
                Icons.wb_sunny_outlined,
                'Wake up',
                '6:00 AM',
                '5 Devices',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildQuickActionCard(
                Icons.nightlight_outlined,
                'Sleep',
                '6:00 AM',
                '5 Devices',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildQuickActionCard(
                Icons.cleaning_services_outlined,
                'Clean',
                '6:00 AM',
                '5 Devices',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildQuickActionCard(
      IconData icon,
      String title,
      String time,
      String devices,
      ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppConstants.primaryBlue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.white, size: 28),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            time,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            devices,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActiveDevices() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Active Devices',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        // Horizontal scrollable device cards (2 visible at a time)
        SizedBox(
          height: 180,  // Height of device cards
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: deviceStates.length,
            itemBuilder: (context, index) {
              final deviceName = deviceStates.keys.elementAt(index);
              final isOn = deviceStates[deviceName]!;
              return Container(
                width: MediaQuery.of(context).size.width * 0.43,
                margin: EdgeInsets.only(
                  right: 16,
                  left: index == 0 ? 0 : 0,
                ),
                child: _buildDeviceCard(deviceName, isOn),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDeviceCard(String deviceName, bool isOn) {
    IconData deviceIcon;

    // Choose icon based on device name
    switch (deviceName) {
      case 'AC':
        deviceIcon = Icons.ac_unit_outlined;
        break;
      case 'Smart TV':
        deviceIcon = Icons.tv_outlined;
        break;
      case 'Smart Bulb':
        deviceIcon = Icons.lightbulb_outline;
        break;
      case 'Washing Machine':
        deviceIcon = Icons.local_laundry_service_outlined;
        break;
      case 'Smart Fan':
        deviceIcon = Icons.air_outlined;
        break;
      case 'Refrigerator':
        deviceIcon = Icons.kitchen_outlined;
        break;
      default:
        deviceIcon = Icons.devices_outlined;
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppConstants.lightBlue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon and Toggle
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                deviceIcon,
                size: 40,
                color: Colors.black87,
              ),
              Transform.scale(
                scale: 0.8,
                child: Switch(
                  value: isOn,
                  onChanged: (value) {
                    setState(() {
                      deviceStates[deviceName] = value;
                    });

                    // Show feedback
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          '$deviceName turned ${value ? "ON" : "OFF"}',
                        ),
                        duration: const Duration(milliseconds: 800),
                      ),
                    );
                  },
                  activeThumbColor: AppConstants.primaryBlue,
                ),
              ),
            ],
          ),

          // Device Name and Location
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                deviceName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Living Room',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
