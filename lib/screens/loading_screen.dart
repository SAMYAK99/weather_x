import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Align(
            alignment: const AlignmentDirectional(-3, -0.3),
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Color(0xFF7F00FF),
                  blurRadius: 100,
                  spreadRadius: 100,
                ),
              ]),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0, -1.2),
            child: Container(
              height: 300,
              width: 600,
              decoration: const BoxDecoration(color: Color(0xFFE100FF)),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
            child: Container(
              decoration: const BoxDecoration(color: Colors.transparent),
            ),
          ),
          Center(
            child: Lottie.asset(
              'assets/weather_lottie.json',
              height: 300.0,
              repeat: true,
              reverse: true,
              animate: true,
            ),
          ),
        ],
      ),
    );
  }
}
