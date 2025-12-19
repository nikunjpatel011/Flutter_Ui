import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'verify_phone_screen.dart';

class WelcomePhoneScreen extends StatefulWidget {
  const WelcomePhoneScreen({super.key});

  @override
  State<WelcomePhoneScreen> createState() => _WelcomePhoneScreenState();
}

class _WelcomePhoneScreenState extends State<WelcomePhoneScreen> {
  final TextEditingController _phoneController = TextEditingController();
  bool _isValid = false;

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _onPhoneChanged(String value) {
    final digitsOnly = value.replaceAll(RegExp(r'\D'), '');
    setState(() {
      _isValid = digitsOnly.length == 10;
    });
  }

  void _continue() {
    final digitsOnly = _phoneController.text.replaceAll(RegExp(r'\D'), '');
    if (digitsOnly.length != 10) {
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => VerifyPhoneScreen(
          phoneNumber: '+91 $digitsOnly',
          onVerified: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFFE7ECFF);
    const buttonColor = Color(0xFF7D9BFF);
    const iconBlue = Color(0xFF2E6CFF);
    const textColor = Color(0xFF111111);
    const subTextColor = Color(0xFF3F3F3F);
    const hintColor = Color(0xFF8B8B8B);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 8),
                      const _LogoMark(color: iconBlue),
                      const SizedBox(height: 24),
                      const Text(
                        'Welcome back',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Enter your phone number to continue',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: subTextColor,
                        ),
                      ),
                      const SizedBox(height: 28),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Phone Number',
                          style: TextStyle(
                            fontSize: 14,
                            color: subTextColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onChanged: _onPhoneChanged,
                        decoration: InputDecoration(
                          hintText: 'Enter Your Mobile Number',
                          hintStyle: const TextStyle(
                            color: hintColor,
                            fontSize: 14,
                          ),
                          prefixIcon: const Icon(
                            Icons.phone_outlined,
                            color: subTextColor,
                          ),
                          prefixText: '+91  |  ',
                          prefixStyle: const TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.w600,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 12,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: Color(0xFF2F2F2F),
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: Color(0xFF2F2F2F),
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: Color(0xFF2F2F2F),
                              width: 1.2,
                            ),
                          ),
                          counterText: '',
                        ),
                      ),
                      const SizedBox(height: 18),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _isValid ? _continue : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _isValid ? buttonColor : Colors.grey,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            elevation: 0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text(
                                'Continue',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.arrow_forward_rounded,
                                color: Colors.white,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "We'll send you a verification code",
                        style: TextStyle(
                          fontSize: 12.5,
                          color: subTextColor,
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _LogoMark extends StatelessWidget {
  const _LogoMark({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 72,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(8),
          child: Image.asset(
            'assets/icons/adsmg.png',
            fit: BoxFit.contain,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
