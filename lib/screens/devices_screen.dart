import 'package:flutter/material.dart';
import '../utils/constants.dart';

class DevicesScreen extends StatefulWidget {
  const DevicesScreen({super.key});

  @override
  State<DevicesScreen> createState() => _DevicesScreenState();
}

class _DevicesScreenState extends State<DevicesScreen> {
  // Same device states as dashboard
  final Map<String, bool> deviceStates = {
    'AC': true,
    'Smart TV': true,
    'Smart Bulb': false,
    'Washing Machine': true,
    'Smart Fan': false,
    'Refrigerator': true,
    'CCTV Camera': false,
    'Doorbell': true,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Devices',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: deviceStates.length,
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            final deviceName = deviceStates.keys.elementAt(index);
            final isOn = deviceStates[deviceName]!;
            return _buildDeviceCard(deviceName, isOn);
          },
        ),
      ),
    );
  }

  Widget _buildDeviceCard(String deviceName, bool isOn) {
    IconData deviceIcon;

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
      case 'CCTV Camera':
        deviceIcon = Icons.camera_alt_outlined;
        break;
      case 'Doorbell':
        deviceIcon = Icons.notifications_on_outlined;
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
          // Icon + Switch
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                deviceIcon,
                size: 36,
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

          // Name + Location
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
