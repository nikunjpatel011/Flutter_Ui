//Second navbar
import 'package:flutter/material.dart';

class CustomBottomNav
    extends
        StatelessWidget {
  final int selectedIndex;
  final Function(
    int,
  )
  onItemTapped;

  const CustomBottomNav({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            26,
          ),
          topRight: Radius.circular(
            26,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: Offset(
              0,
              -1,
            ),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: navItemIcon(
                  Icons.home_rounded,
                  'Home',
                  0,
                ),
              ),
              Expanded(
                child: navItemIcon(
                  Icons.people_alt_rounded,
                  'Leads',
                  1,
                ),
              ),
              Expanded(
                child: navItemIcon(
                  Icons.query_stats_rounded,
                  'Campaigns',
                  2,
                ),
              ),
              Expanded(
                child: navItemIcon(
                  Icons.account_circle_rounded,
                  'Account',
                  3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget navItemIcon(
    IconData icon,
    String label,
    int index,
  ) {
    final bool isActive =
        selectedIndex ==
        index;
    const activeColor = Color(
      0xFF2663FF,
    );

    return InkWell(
      onTap: () => onItemTapped(
        index,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 26,
            color: isActive ? activeColor : Colors.grey.shade600,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isActive
                  ? activeColor
                  : Colors.grey.shade600,
              fontWeight: isActive
                  ? FontWeight.w600
                  : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
