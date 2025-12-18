import 'package:flutter/material.dart';

class NotificationButton
    extends
        StatelessWidget {
  final VoidCallback onPressed;

  const NotificationButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(
        30,
      ),
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            12,
          ),
          gradient: const LinearGradient(
            colors: [
              Color(
                0xFF6C63FF,
              ),
              Color(
                0xFF8D6CFF,
              ),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const Icon(
          Icons.notifications_none,
          color: Colors.white,
          size: 22,
        ),
      ),
    );
  }
}
