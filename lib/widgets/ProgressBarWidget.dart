import 'package:flutter/material.dart';

class ProgressBarWidget extends StatefulWidget {
  const ProgressBarWidget({super.key});

  @override
  State<ProgressBarWidget> createState() => _ProgressBarWidgetState();
}

class _ProgressBarWidgetState extends State<ProgressBarWidget> with SingleTickerProviderStateMixin {
  int _currentStep = 0; // Track current completed step (0-8)
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onBoxTap(int index) {
    // Allow clicking next box to select or clicking current box to unselect
    if (index == _currentStep + 1 && _currentStep < 8) {
      setState(() {
        _currentStep = index;
      });
      _animationController.forward(from: 0.0);
    } else if (index == _currentStep && _currentStep > 0) {
      setState(() {
        _currentStep = index - 1;
      });
      _animationController.forward(from: 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final boxWidth = (screenWidth - 32 - 8) / 9;
    const boxHeight = 15.0;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 12.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Labels above progress bar (boxes 2,4,6,8)
          Row(
            children: List.generate(9, (index) {
              final labels = ['', 'Business', '', 'Budget', '', 'Preview', '', 'Payment', ''];
              final isVisible = index <= _currentStep;
              return Expanded(
                child: labels[index].isNotEmpty && isVisible
                    ? FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          labels[index],
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                        ),
                      )
                    : SizedBox.shrink(),
              );
            }),
          ),
          const SizedBox(height: 8.0),
          // Progress bar with 9 separate boxes
          Row(
            children: List.generate(9, (index) {
              final isCompleted = index < _currentStep;
              final isCurrentBox = index == _currentStep;
              final isClickable = index == _currentStep + 1 || index == _currentStep;
              return Expanded(
                child: GestureDetector(
                  onTap: isClickable ? () => _onBoxTap(index) : null,
                  child: AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Container(
                        height: boxHeight,
                        margin: EdgeInsets.only(right: index < 8 ? 1 : 0),
                        decoration: BoxDecoration(
                          borderRadius: index == 0
                              ? const BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(10.0),
                                )
                              : index == 8
                                  ? const BorderRadius.only(
                                      topRight: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0),
                                    )
                                  : BorderRadius.zero,
                          border: Border.all(
                            color: (isCompleted || isCurrentBox) ? const Color(0xFF007BFF) : Colors.grey[300]!,
                            width: 1,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: index == 0
                              ? const BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(10.0),
                                )
                              : index == 8
                                  ? const BorderRadius.only(
                                      topRight: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0),
                                    )
                                  : BorderRadius.zero,
                          child: Stack(
                            children: [
                              Container(color: Colors.white),
                              if (isCompleted)
                                Container(color: const Color(0xFF007BFF)),
                              if (isCurrentBox)
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: FractionallySizedBox(
                                    widthFactor: _animation.value,
                                    child: Container(
                                      color: const Color(0xFF007BFF),
                                      child: _animation.value > 0.5
                                          ? Center(
                                              child: FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: Text(
                                                  '${((_currentStep + 1) / 9 * 100).toInt()}%',
                                                  style: TextStyle(
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            )
                                          : null,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 8.0),
          // Labels below progress bar (boxes 1,3,5,7,9)
          Row(
            children: List.generate(9, (index) {
              final labels = ['Search', '', 'Location', '', 'Result', '', 'Plan', '', 'Ad Live'];
              final isVisible = index <= _currentStep;
              return Expanded(
                child: labels[index].isNotEmpty && isVisible
                    ? FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          labels[index],
                          style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                        ),
                      )
                    : SizedBox.shrink(),
              );
            }),
          ),
          const SizedBox(
            height: 8.0,
          ),
        ],
      ),
    );
  }
}
