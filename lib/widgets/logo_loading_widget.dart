import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingAnimation
    extends
        StatelessWidget {
  const LoadingAnimation({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(
                0xFFDCE1FF,
              ),
              Colors.white,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Image.asset(
                'assets/icons/adsmg.png',
                width: 80,
                height: 80,
                fit: BoxFit.contain,
              ),
              const SizedBox(
                height: 10,
              ),
              // SpinKit Three Bounce Animation
              const SpinKitThreeBounce(
                color: Colors.blue,
                size: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
