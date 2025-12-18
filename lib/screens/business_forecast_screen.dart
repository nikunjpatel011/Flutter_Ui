import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BusinessForecastScreen
    extends
        StatefulWidget {
  final String? selectedProduct;
  const BusinessForecastScreen({
    super.key,
    this.selectedProduct,
  });

  @override
  State<
    BusinessForecastScreen
  >
  createState() => _BusinessForecastScreenState();
}

class _BusinessForecastScreenState
    extends
        State<
          BusinessForecastScreen
        > {
  bool _snapshotOpen = true;
  bool _observationOpen = false;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFF3F5FF,
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            CupertinoIcons.back,
            color: Colors.black87,
          ),
          onPressed: () => Navigator.of(
            context,
          ).pop(),
        ),
        title: Text(
          widget.selectedProduct?.isNotEmpty ==
                  true
              ? '${widget.selectedProduct!} forecast'
              : 'Business forecast',
          style:
              Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        child: ListView(
          children: [
            _ForecastCard(
              gradientColors: const [
                Color(
                  0xFF4C7CFF,
                ),
                Color(
                  0xFF70A3FF,
                ),
              ],
              icon: CupertinoIcons.person_2_fill,
              title: 'Your business snapshot',
              subtitle: 'A quick overview of how your business looks right now.',
              expanded: _snapshotOpen,
              onToggle: () => setState(
                () => _snapshotOpen = !_snapshotOpen,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  _DetailRow(
                    icon: CupertinoIcons.cube_box,
                    label: 'Industry',
                    value: 'Metal Recycling & Trading',
                  ),
                  _DetailRow(
                    icon: CupertinoIcons.location,
                    label: 'Based in',
                    value: 'Rajkot, Gujarat, India',
                  ),
                  _DetailRow(
                    icon: CupertinoIcons.scope,
                    label: 'Specializes in',
                    value: 'Alloy scrap procurement and resale',
                  ),
                  _DetailRow(
                    icon: CupertinoIcons.person_2,
                    label: 'Provides',
                    value: 'Industrial manufacturers & B2B clients',
                  ),
                  _DetailRow(
                    icon: CupertinoIcons.money_dollar,
                    label: 'Daily Ad Spend',
                    value: '\u20B9200',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            _ForecastCard(
              gradientColors: const [
                Color(
                  0xFFD56FFF,
                ),
                Color(
                  0xFFA045FF,
                ),
              ],
              icon: CupertinoIcons.eye_fill,
              title: 'Our key observation',
              subtitle: "Here's what stood out to us after analyzing your data.",
              expanded: _observationOpen,
              onToggle: () => setState(
                () => _observationOpen = !_observationOpen,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  _ObservationRow(
                    title: 'What motivates your buyers:',
                    detail: 'Buyers focus on quality, price, and steady supply.',
                  ),
                  _ObservationRow(
                    title: 'Common challenges:',
                    detail: 'Competition and changing metal prices.',
                  ),
                  _ObservationRow(
                    title: 'What helps you stand out:',
                    detail: 'Consistent quality, clear pricing, and logistics help you win trust.',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              'Smart Ad Suggestions',
              style:
                  Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                    fontSize: 16,
                  ),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              'We recommend running Facebook Ads. Click "Generate Ad" and select this option.',
              style:
                  Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(
                    color: Colors.black87,
                    height: 1.35,
                  ),
            ),
            const SizedBox(
              height: 10,
            ),
            _AdSuggestionCard(
              icon: Icons.facebook,
              iconGradient: const [
                Color(
                  0xFF5E7CFF,
                ),
                Color(
                  0xFF7EA1FF,
                ),
              ],
              title: 'Facebook Leads',
              badgeText: 'Recommended',
              badgeColor: const Color(
                0xFF0FB463,
              ),
              badgeTextColor: Colors.white,
              stats: [
                (
                  'Your Daily Ad Budget',
                  '\u20B9500',
                  CupertinoIcons.money_dollar,
                ),
                (
                  'People Who May See',
                  '7,34,820',
                  CupertinoIcons.person_2,
                ),
                (
                  'Ad Views',
                  '7,38,225',
                  CupertinoIcons.eye,
                ),
                (
                  'Interested People',
                  '553',
                  CupertinoIcons.scope,
                ),
              ],
              footerText: 'These are estimated results - your real numbers may grow as your ads go live!',
              footerLinkText: 'Tap for full details',
              footerLinkIcon: CupertinoIcons.arrow_up_right,
              primaryButton: null,
              outlineColor: const Color(
                0xFFD9DEFF,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            _AdSuggestionCard(
              icon: CupertinoIcons.globe,
              iconGradient: const [
                Color(
                  0xFF4C7CFF,
                ),
                Color(
                  0xFF5E9BFF,
                ),
              ],
              title: 'Facebook Traffic',
              badgeText: null,
              badgeColor: Colors.transparent,
              badgeTextColor: Colors.transparent,
              stats: [
                (
                  'Your Daily Ad Budget',
                  '\u20B9500',
                  CupertinoIcons.money_dollar,
                ),
                (
                  'People Who May See',
                  '16,618',
                  CupertinoIcons.person_2,
                ),
                (
                  'Ad Views',
                  '18,504',
                  CupertinoIcons.eye,
                ),
                (
                  'Interested People',
                  '3',
                  CupertinoIcons.scope,
                ),
              ],
              footerText: 'These are estimated results - your real numbers may grow as your ads go live!',
              footerLinkText: null,
              footerLinkIcon: null,
              primaryButton: _PrimaryButtonConfig(
                text: 'Generate Ad',
                color: const Color(
                  0xFF1F75FF,
                ),
                textColor: Colors.white,
              ),
              outlineColor: const Color(
                0xFFD9DEFF,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            _AdSuggestionCard(
              icon: CupertinoIcons.search,
              iconGradient: const [
                Color(
                  0xFFE53935,
                ),
                Color(
                  0xFFEF5350,
                ),
              ],
              title: 'Google',
              badgeText: null,
              badgeColor: Colors.transparent,
              badgeTextColor: Colors.transparent,
              stats: [
                (
                  'Your Daily Ad Budget',
                  '\u20B9500',
                  CupertinoIcons.money_dollar,
                ),
                (
                  'People Who May See',
                  '1,39,576',
                  CupertinoIcons.person_2,
                ),
                (
                  'Ad Views',
                  '1,65,840',
                  CupertinoIcons.eye,
                ),
                (
                  'Interested People',
                  '85',
                  CupertinoIcons.scope,
                ),
              ],
              footerText: 'These are estimated results - your real numbers may grow as your ads go live!',
              footerLinkText: null,
              footerLinkIcon: null,
              primaryButton: _PrimaryButtonConfig(
                text: 'Generate Ad',
                color: const Color(
                  0xFFE53935,
                ),
                textColor: Colors.white,
              ),
              outlineColor: const Color(
                0xFFEBD2D2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ForecastCard
    extends
        StatelessWidget {
  final List<
    Color
  >
  gradientColors;
  final IconData icon;
  final String title;
  final String subtitle;
  final bool expanded;
  final VoidCallback onToggle;
  final Widget child;

  const _ForecastCard({
    required this.gradientColors,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.expanded,
    required this.onToggle,
    required this.child,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(
        16,
        14,
        16,
        16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          18,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(
              0x14000000,
            ),
            blurRadius: 12,
            offset: Offset(
              0,
              6,
            ),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    14,
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: gradientColors,
                  ),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 26,
                ),
              ),
              const SizedBox(
                width: 14,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style:
                          Theme.of(
                            context,
                          ).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                            fontSize: 16,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      subtitle,
                      style:
                          Theme.of(
                            context,
                          ).textTheme.bodySmall?.copyWith(
                            color: Colors.black87,
                            height: 1.3,
                            fontSize: 12.5,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: onToggle,
                icon: AnimatedRotation(
                  turns: expanded
                      ? 0.5
                      : 0.0,
                  duration: const Duration(
                    milliseconds: 200,
                  ),
                  child: const Icon(
                    CupertinoIcons.chevron_down,
                    color: Colors.black87,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: Padding(
              padding: const EdgeInsets.fromLTRB(
                12,
                14,
                12,
                6,
              ),
              child: child,
            ),
            crossFadeState: expanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(
              milliseconds: 220,
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailRow
    extends
        StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 12,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: const Color(
                0xFF3C73FF,
              ),
              size: 20,
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style:
                        Theme.of(
                          context,
                        ).textTheme.bodySmall?.copyWith(
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.5,
                        ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    value,
                    style:
                        Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.2,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ObservationRow
    extends
        StatelessWidget {
  final String title;
  final String detail;
  const _ObservationRow({
    required this.title,
    required this.detail,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 12,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style:
                  Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                    fontSize: 14,
                  ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              detail,
              style:
                  Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(
                    color: Colors.black87,
                    fontSize: 13.5,
                    height: 1.35,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PrimaryButtonConfig {
  final String text;
  final Color color;
  final Color textColor;
  const _PrimaryButtonConfig({
    required this.text,
    required this.color,
    required this.textColor,
  });
}

class _AdSuggestionCard
    extends
        StatelessWidget {
  final IconData icon;
  final List<
    Color
  >
  iconGradient;
  final String title;
  final String? badgeText;
  final Color badgeColor;
  final Color badgeTextColor;
  final List<
    (
      String,
      String,
      IconData,
    )
  >
  stats;
  final String footerText;
  final String? footerLinkText;
  final IconData? footerLinkIcon;
  final _PrimaryButtonConfig? primaryButton;
  final Color outlineColor;

  const _AdSuggestionCard({
    required this.icon,
    required this.iconGradient,
    required this.title,
    required this.badgeText,
    required this.badgeColor,
    required this.badgeTextColor,
    required this.stats,
    required this.footerText,
    required this.footerLinkText,
    required this.footerLinkIcon,
    required this.primaryButton,
    required this.outlineColor,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(
        16,
        14,
        16,
        14,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          16,
        ),
        border: Border.all(
          color: outlineColor,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(
              0x0F000000,
            ),
            blurRadius: 12,
            offset: Offset(
              0,
              6,
            ),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: iconGradient,
                  ),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Text(
                  title,
                  style:
                      Theme.of(
                        context,
                      ).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                        fontSize: 16,
                      ),
                ),
              ),
              if (badgeText !=
                  null)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: badgeColor,
                    borderRadius: BorderRadius.circular(
                      16,
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        CupertinoIcons.checkmark_alt,
                        size: 14,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        badgeText!,
                        style: TextStyle(
                          color: badgeTextColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          _StatGrid(
            stats: stats,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            footerText,
            style:
                Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(
                  color: Colors.black87,
                  height: 1.35,
                ),
            textAlign: TextAlign.center,
          ),
          if (footerLinkText !=
              null) ...[
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  footerLinkText!,
                  style: TextStyle(
                    color: const Color(
                      0xFF1F75FF,
                    ),
                    fontWeight: FontWeight.w500,
                    fontSize: 13.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  width: 4,
                ),
                Icon(
                  footerLinkIcon ??
                      CupertinoIcons.arrow_up_right,
                  color: const Color(
                    0xFF1F75FF,
                  ),
                  size: 16,
                ),
              ],
            ),
          ],
          if (primaryButton !=
              null) ...[
            const SizedBox(
              height: 14,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryButton!.color,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  elevation: 0,
                ),
                onPressed: () {},
                child: Text(
                  primaryButton!.text,
                  style: TextStyle(
                    color: primaryButton!.textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _StatGrid
    extends
        StatelessWidget {
  final List<
    (
      String,
      String,
      IconData,
    )
  >
  stats;
  const _StatGrid({
    required this.stats,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.9,
      ),
      itemCount: stats.length,
      itemBuilder:
          (
            context,
            index,
          ) {
            final stat = stats[index];
            return Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(
                    0xFFD7DCED,
                  ),
                ),
                borderRadius: BorderRadius.circular(
                  10,
                ),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Icon(
                    stat.$3,
                    color: const Color(
                      0xFF3C73FF,
                    ),
                    size: 18,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          stat.$1,
                          style:
                              Theme.of(
                                context,
                              ).textTheme.bodySmall?.copyWith(
                                color: Colors.black87,
                                fontSize: 12,
                                height: 1.25,
                              ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          stat.$2,
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
    );
  }
}
