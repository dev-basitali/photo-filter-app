import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:camera/camera.dart';

import '../Home Screen/home_screen.dart';

class SplashScreen extends StatelessWidget {
  final List<CameraDescription> cameras;

  const SplashScreen({super.key, required this.cameras});

  @override
  Widget build(BuildContext context) {
    // Use a callback to navigate to the next screen after the splash duration
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomeScreen(
              cameras: cameras,
            ),
          ),
        );
      });
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset(width: 300,height: 300,'assets/Images/logo.png')),
        ],
      ),
    );
  }
}
