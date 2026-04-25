import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PromoBanner extends StatefulWidget {
  const PromoBanner({super.key});

  @override
  State<PromoBanner> createState() => _PromoBannerState();
}

class _PromoBannerState extends State<PromoBanner> {
  int _currentIndex = 0;

  final List<BannerData> banners = const [
    BannerData(
      tag: 'Fresh Picks',
      title: 'Organic Veggies &\nSeasonal Fruits',
      subtitle: 'Farm‑fresh goodness at\nspecial prices today.',
      badge: 'Limited Offer',
      btnLabel: 'Shop Fresh',
      highlightWord: 'Seasonal Fruits',
      imagePath: 'assets/images/banner/banner1.png',
    ),

    BannerData(
      tag: 'Snack Fest',
      title: 'Tasty Treats &\nFresh Bites',
      subtitle: 'From crunchy chips to\nfarm‑fresh fruits.',
      badge: 'Hot Picks',
      btnLabel: 'Grab Now',
      highlightWord: 'Fresh Bites',
      imagePath: 'assets/images/banner/banner2.png',
    ),

    BannerData(
      tag: 'Special Offer',
      title: 'Buy 2 Get 1\nFree',
      subtitle: 'All beauty &\nskincare products.',
      badge: 'B2G1 Free',
      btnLabel: 'Grab Deal',
      highlightWord: 'Free',
      imagePath: 'assets/images/banner/banner3.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.9,
            aspectRatio: 16 / 9,
            autoPlayInterval: const Duration(seconds: 4),
            autoPlayAnimationDuration: const Duration(milliseconds: 700),
            autoPlayCurve: Curves.easeInOutCubic,
            onPageChanged: (index, _) => setState(() => _currentIndex = index),
          ),
          items: banners.map((b) => BannerCard(data: b)).toList(),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(banners.length, (i) {
            final active = i == _currentIndex;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: active ? 22 : 6,
              height: 6,
              decoration: BoxDecoration(
                color: active
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class BannerCard extends StatelessWidget {
  const BannerCard({super.key, required this.data});
  final BannerData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xFF0f3460).withOpacity(0.4),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(data.imagePath, fit: BoxFit.cover),
            ),

            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF1a1a2e).withOpacity(0.95),
                      const Color(0xFF0f3460).withOpacity(0.6),
                      Colors.transparent,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: const [0.0, 0.4, 1.0],
                  ),
                ),
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Tag chip
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFFe94560).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Color(0xFFe94560).withOpacity(0.4),
                        width: 0.8,
                      ),
                    ),
                    child: Text(
                      data.tag.toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.4,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  HighlightedTitle(
                    text: data.title,
                    highlight: data.highlightWord,
                    accentColor: Color(0xFFe94560),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    data.subtitle,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 11,
                      height: 1.45,
                    ),
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFe94560),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            data.btnLabel,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.arrow_forward_rounded,
                            color: Colors.white,
                            size: 14,
                          ),
                        ],
                      ),
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

class HighlightedTitle extends StatelessWidget {
  const HighlightedTitle({
    super.key,
    required this.text,
    required this.highlight,
    required this.accentColor,
  });

  final String text, highlight;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    final lines = text.split('\n');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: lines.map((line) {
        if (line.contains(highlight)) {
          final parts = line.split(highlight);
          return RichText(
            text: TextSpan(
              children: [
                if (parts[0].isNotEmpty)
                  TextSpan(
                    text: parts[0],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      height: 1.2,
                    ),
                  ),
                TextSpan(
                  text: highlight,
                  style: TextStyle(
                    color: accentColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    height: 1.2,
                  ),
                ),
                if (parts.length > 1 && parts[1].isNotEmpty)
                  TextSpan(
                    text: parts[1],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      height: 1.2,
                    ),
                  ),
              ],
            ),
          );
        }
        return Text(
          line,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w800,
            height: 1.2,
          ),
        );
      }).toList(),
    );
  }
}

// ─── Data model ───────────────────────────────────────────────────────────────

class BannerData {
  const BannerData({
    required this.tag,
    required this.title,
    required this.subtitle,
    required this.badge,
    required this.btnLabel,
    required this.highlightWord,
    // required this.gradientColors,
    // required this.accentColor,
    // required this.decoColor,
    required this.imagePath,
  });

  final String tag, title, subtitle, badge, btnLabel, highlightWord, imagePath;
  // final List<Color> gradientColors;
  // final Color accentColor, decoColor;
}
