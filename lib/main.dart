import 'screens/welcome_phone_screen.dart';
import 'package:flutter/material.dart';
import 'widgets/custom_bottom_nav.dart';
import 'widgets/back_button_widget.dart';
import 'widgets/next_button_widget.dart';
import 'widgets/notification_button.dart';
import 'widgets/profile_button.dart';
import 'widgets/business_search_widget.dart'; // <-- NEW IMPORT
import 'models/business_model.dart';
import 'screens/business_info_screen.dart';
import 'widgets/logo_loading_widget.dart';
import 'widgets/ProgressBarWidget.dart';

void
main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MyApp(),
  );
}

class MyApp
    extends
        StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WelcomePhoneScreen(),
      routes: {
        '/home': (_) => const MainScreen(),
      },
    );
  }
}

// ----------------------
// MAIN SCREEN
// ----------------------

class MainScreen
    extends
        StatefulWidget {
  const MainScreen({
    super.key,
  });

  @override
  State<
    MainScreen
  >
  createState() => _MainScreenState();
}

class _MainScreenState
    extends
        State<
          MainScreen
        > {
  int _selectedIndex = 0;
  bool _showLoader = false;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: Stack(
        children: [
          // MAIN COLUMN CONTENT
          Column(
            children: [
              const SizedBox(
                height: 270,
              ), // space for icons + progress bar + search box

              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Selected Page: $_selectedIndex",
                        style: const TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(
                            () {
                              _showLoader = true;
                            },
                          );
                          // Auto-hide loader after 3 seconds
                          Future.delayed(
                            const Duration(
                              seconds: 3,
                            ),
                            () {
                              if (mounted) {
                                setState(
                                  () {
                                    _showLoader = false;
                                  },
                                );
                              }
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(
                            0xFF2663FF,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                          ),
                        ),
                        child: const Text(
                          "Show Loader",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Scaffold(
                                appBar: AppBar(
                                  title: const Text("Progress Bar"),
                                ),
                                body: const Center(
                                  child: ProgressBarWidget(),
                                ),
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(
                            0xFF2663FF,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                          ),
                        ),
                        child: const Text(
                          "Progress Bar",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Back + Next Buttons
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BackButtonWidget(
                      onPressed: () {
                        debugPrint(
                          "Back pressed",
                        );
                      },
                    ),
                    NextButtonWidget(
                      onPressed: () {
                        debugPrint(
                          "Next pressed",
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 50,
              ), // 30px above bottom nav
            ],
          ),

          // â­ FIXED TOP-RIGHT BUTTONS
          Positioned(
            top: 10,
            right: 20,
            child: Row(
              children: [
                NotificationButton(
                  onPressed: () {
                    debugPrint(
                      "Notification pressed",
                    );
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                ProfileButton(
                  initials: "FK",
                  onPressed: () {
                    debugPrint(
                      "Profile pressed",
                    );
                  },
                ),
              ],
            ),
          ),

          // â­ PROGRESS BAR WIDGET
          Positioned(
            top: 70,
            left: 20,
            right: 20,
            child: ProgressBarWidget(),
          ),

          // â­ BUSINESS SEARCH WIDGET (NEW)
          Positioned(
            top: 180,
            left: 20,
            right: 20,
            child: BusinessSearchWidget(
              onSelect:
                  (
                    businessTitle,
                  ) {
                    // OPEN BUSINESS INFO SCREEN
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (
                              _,
                            ) => BusinessInfoScreen(
                              business: BusinessModel(
                                title: businessTitle,
                                businessType: "Establishment, Gym, Health",
                                address: "Sample Address",
                                contact: "+91 98765 43210",
                                website: "www.${businessTitle.toLowerCase().replaceAll(" ", "")}.com",
                              ),
                            ),
                      ),
                    );
                  },
            ),
          ),

          if (_showLoader)
            Positioned.fill(
              child: Container(
                color: Colors.white,
                child: Center(
                  child: LoadingAnimation(),
                ),
              ),
            ),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: CustomBottomNav(
        selectedIndex: _selectedIndex,
        onItemTapped:
            (
              index,
            ) {
              setState(
                () {
                  _selectedIndex = index;
                },
              );
            },
      ),
    );
  }
}



