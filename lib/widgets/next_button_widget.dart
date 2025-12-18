import 'package:flutter/material.dart';

class NextButtonWidget
    extends
        StatelessWidget {
  final VoidCallback onPressed;

  const NextButtonWidget({
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
        padding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: Color(
            0xFF6EA5FF,
          ), // Soft blue like screenshot
          borderRadius: BorderRadius.circular(
            30,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(
                0,
                2,
              ),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              "Next",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              width: 6,
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
