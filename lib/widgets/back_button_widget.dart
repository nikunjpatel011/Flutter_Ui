import 'package:flutter/material.dart';

class BackButtonWidget
    extends
        StatelessWidget {
  final VoidCallback onPressed;

  const BackButtonWidget({
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
          horizontal: 18,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            30,
          ),
          border: Border.all(
            color: Colors.black26,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              Icons.arrow_back_ios_new,
              size: 16,
              color: Colors.black54,
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              "Back",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
