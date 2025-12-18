import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/business_model.dart';
import '../widgets/back_button_widget.dart';
import '../widgets/next_button_widget.dart';
import '../widgets/custom_bottom_nav.dart';
import 'business_forecast_screen.dart';
// import '../widgets/custom_bottom_nav.dart';

class BusinessInfoScreen
    extends
        StatefulWidget {
  final BusinessModel business;
  const BusinessInfoScreen({
    super.key,
    required this.business,
  });

  @override
  State<
    BusinessInfoScreen
  >
  createState() => _BusinessInfoScreenState();
}

class _BusinessInfoScreenState
    extends
        State<
          BusinessInfoScreen
        > {
  String? _selectedProduct;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: CustomBottomNav(
        selectedIndex: 0,
        onItemTapped:
            (
              _,
            ) {},
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(
                0xFFE8F0FF,
              ),
              Color(
                0xFFF9FBFF,
              ),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(
                    CupertinoIcons.back,
                    size: 24,
                    color: Colors.black87,
                  ),
                  onPressed: () => Navigator.of(
                    context,
                  ).pop(),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const Icon(
                      CupertinoIcons.briefcase_fill,
                      color: Colors.blue,
                      size: 22,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Business Information',
                      style:
                          Theme.of(
                            context,
                          ).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  'Your business details verified by Us',
                  style:
                      Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(
                        color: Colors.black54,
                        height: 1.3,
                      ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      14,
                    ),
                    border: Border.all(
                      color: const Color(
                        0xFFE4E8F1,
                      ),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(
                          0x14000000,
                        ),
                        blurRadius: 10,
                        offset: Offset(
                          0,
                          4,
                        ),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.business.title,
                        style:
                            Theme.of(
                              context,
                            ).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      ..._infoItems(
                        context,
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                _productsSection(
                  context,
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BackButtonWidget(
                        onPressed: () => Navigator.of(
                          context,
                        ).pop(),
                      ),
                      NextButtonWidget(
                        onPressed: () {
                          if (_selectedProduct ==
                              null) {
                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Please select a product or service to continue.',
                                ),
                              ),
                            );
                            return;
                          }
                          Navigator.of(
                            context,
                          ).push(
                            MaterialPageRoute(
                              builder:
                                  (
                                    _,
                                  ) => BusinessForecastScreen(
                                    selectedProduct: _selectedProduct!,
                                  ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<
    Widget
  >
  _infoItems(
    BuildContext context,
  ) {
    final entries = [
      (
        icon: CupertinoIcons.doc_plaintext,
        title: 'Business Type',
        subtitle: widget.business.businessType,
      ),
      (
        icon: CupertinoIcons.location_solid,
        title: 'Address',
        subtitle: widget.business.address,
      ),
      (
        icon: CupertinoIcons.phone_fill,
        title: 'Contact',
        subtitle: widget.business.contact,
      ),
      (
        icon: CupertinoIcons.link,
        title: 'Website',
        subtitle: widget.business.website,
      ),
    ];

    return entries
        .map(
          (
            e,
          ) => Padding(
            padding: const EdgeInsets.only(
              bottom: 12,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                    border: Border.all(
                      color: const Color(
                        0xFFD5DEEF,
                      ),
                    ),
                  ),
                  child: Icon(
                    e.icon,
                    color: const Color(
                      0xFF3C73FF,
                    ),
                    size: 20,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        e.title,
                        style:
                            Theme.of(
                              context,
                            ).textTheme.bodySmall?.copyWith(
                              color: Colors.black87,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        e.subtitle,
                        style:
                            Theme.of(
                              context,
                            ).textTheme.bodyMedium?.copyWith(
                              color: Colors.black,
                              fontSize: 14.5,
                              height: 1.3,
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Icon(
                  CupertinoIcons.check_mark_circled_solid,
                  color: Color(
                    0xFF1BC162,
                  ),
                  size: 21,
                ),
              ],
            ),
          ),
        )
        .toList();
  }

  Widget _productsSection(
    BuildContext context,
  ) {
    final products = [
      (
        icon: CupertinoIcons.briefcase,
        label: 'Personal Loan',
      ),
      (
        icon: CupertinoIcons.cart,
        label: 'Business Loan',
      ),
      (
        icon: CupertinoIcons.house,
        label: 'Home Loan',
      ),
      (
        icon: CupertinoIcons.cart_badge_plus,
        label: 'Overdraft',
      ),
      (
        icon: CupertinoIcons.person_2,
        label: 'Consultancy',
      ),
      (
        icon: CupertinoIcons.creditcard,
        label: 'Cash Credit',
      ),
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 18,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          14,
        ),
        border: Border.all(
          color: const Color(
            0xFFE4E8F1,
          ),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(
              0x14000000,
            ),
            blurRadius: 10,
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                CupertinoIcons.cube_box,
                color: Colors.blue,
                size: 22,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                'Products & Services',
                style:
                    Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Select your best choices for the next steps in the ad process.',
            style:
                Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(
                  color: Colors.black87,
                  fontSize: 13,
                  height: 1.3,
                ),
          ),
          const SizedBox(
            height: 14,
          ),
          LayoutBuilder(
            builder:
                (
                  context,
                  constraints,
                ) {
                  final double itemWidth =
                      (constraints.maxWidth -
                          10) /
                      2;

                  return Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: products.map(
                      (
                        item,
                      ) {
                        final bool isSelected =
                            _selectedProduct ==
                            item.label;
                        final bool isDimmed =
                            _selectedProduct !=
                                null &&
                            !isSelected;

                        return SizedBox(
                          width: itemWidth,
                          child: _productChip(
                            context: context,
                            icon: item.icon,
                            label: item.label,
                            isDimmed: isDimmed,
                            onTap: () {
                              if (isSelected) {
                                setState(
                                  () => _selectedProduct = null,
                                );
                                return;
                              }
                              setState(
                                () => _selectedProduct = item.label,
                              );
                            },
                          ),
                        );
                      },
                    ).toList(),
                  );
                },
          ),
        ],
      ),
    );
  }

  Widget _productChip({
    required BuildContext context,
    required IconData icon,
    required String label,
    required bool isDimmed,
    required VoidCallback onTap,
  }) {
    final double targetOpacity = isDimmed
        ? 0.35
        : 1;

    return IgnorePointer(
      ignoring: isDimmed,
      child: AnimatedOpacity(
        duration: const Duration(
          milliseconds: 180,
        ),
        opacity: targetOpacity,
        child: ColorFiltered(
          colorFilter: isDimmed
              ? const ColorFilter.matrix(
                  <
                    double
                  >[
                    0.3,
                    0.59,
                    0.11,
                    0,
                    0,
                    0.3,
                    0.59,
                    0.11,
                    0,
                    0,
                    0.3,
                    0.59,
                    0.11,
                    0,
                    0,
                    0,
                    0,
                    0,
                    1,
                    0,
                  ],
                )
              : const ColorFilter.mode(
                  Colors.transparent,
                  BlendMode.srcIn,
                ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(
                12,
              ),
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                  border: Border.all(
                    color: const Color(
                      0xFFD9DFEA,
                    ),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      icon,
                      color: Colors.black87,
                      size: 18,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        label,
                        style:
                            Theme.of(
                              context,
                            ).textTheme.bodyMedium?.copyWith(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
