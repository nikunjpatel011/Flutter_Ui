import 'package:flutter/material.dart';

class ProfileButton
    extends
        StatelessWidget {
  final String initials;
  final VoidCallback onPressed;

  const ProfileButton({
    super.key,
    required this.initials,
    required this.onPressed,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(
        40,
      ),
      onTap: onPressed,
      child: Container(
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              Color(
                0xFF8A5BFF,
              ),
              Color(
                0xFFCE4DFF,
              ),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Text(
            initials,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
