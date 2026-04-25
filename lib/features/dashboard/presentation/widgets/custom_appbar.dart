import 'package:flutter/material.dart';
import 'package:quikmart/core/theme/app_colors.dart';

class QuickMartAppBar extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback? onLogoutTap;
  final VoidCallback? onCartTap;
  final VoidCallback? onSearchTap;
  final VoidCallback? onLocationTap;
  final String deliveryLocation;
  final int cartCount;

  const QuickMartAppBar({
    super.key,
    required this.title,
    required this.iconPath,
    this.onLogoutTap,
    this.onCartTap,
    this.onSearchTap,
    this.onLocationTap,
    this.deliveryLocation = 'Select location',
    this.cartCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 140,
      floating: false,
      pinned: true,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        background: AppBarContent(
          title: title,
          iconPath: iconPath,
          onLogoutTap: onLogoutTap,
          onCartTap: onCartTap,
          onSearchTap: onSearchTap,
          onLocationTap: onLocationTap,
          deliveryLocation: deliveryLocation,
          cartCount: cartCount,
        ),
      ),
    );
  }
}

class AppBarContent extends StatelessWidget {
  const AppBarContent({
    super.key,
    required this.title,
    required this.iconPath,
    this.onLogoutTap,
    this.onCartTap,
    this.onSearchTap,
    this.onLocationTap,
    required this.deliveryLocation,
    required this.cartCount,
  });

  final String title, deliveryLocation;
  final String iconPath;
  final VoidCallback? onLogoutTap, onCartTap, onSearchTap, onLocationTap;
  final int cartCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFEA580C), Color(0xFFC2410C), Color(0xFF7C2D12)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          // Decorative circles for depth
          _DecoCircle(size: 160, x: -30, y: -60, opacity: 0.07),
          _DecoCircle(size: 90, x: 260, y: 20, opacity: 0.09),
          _DecoCircle(
            size: 55,
            x: 190,
            y: -15,
            opacity: 0.18,
            color: const Color(0xFFFF7832),
          ),
          // Main content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 34,
                        height: 34,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(9),
                          child: Image.asset(iconPath, fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.4,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: onCartTap,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            GestureDetector(
                              onTap: onCartTap,
                              child: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white.withOpacity(0.12),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.22),
                                  ),
                                ),
                                child: Center(
                                  child: const Icon(
                                    Icons.shopping_bag_outlined,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),

                            if (cartCount > 0)
                              Positioned(
                                top: -3,
                                right: -3,
                                child: Container(
                                  width: 16,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFBBF24),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: const Color(0xFFC2410C),
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      cartCount > 9 ? '9+' : '$cartCount',
                                      style: const TextStyle(
                                        color: Color(0xFF7C2D12),
                                        fontSize: 8,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: onLogoutTap,
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.12),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.22),
                            ),
                          ),
                          child: Center(
                            child: const Icon(
                              Icons.logout_rounded,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Row 2: Delivery location
                  GestureDetector(
                    onTap: onLocationTap,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on_rounded,
                          color: Colors.white,
                          size: 13,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Deliver to  ',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.65),
                            fontSize: 11,
                          ),
                        ),
                        Text(
                          deliveryLocation,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Colors.white.withOpacity(0.75),
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Row 3: Search bar
                  GestureDetector(
                    onTap: onSearchTap,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 9,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.18),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search_rounded,
                            color: Colors.white.withOpacity(0.6),
                            size: 16,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Search products...',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 13,
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.tune_rounded,
                            color: Colors.white.withOpacity(0.45),
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DecoCircle extends StatelessWidget {
  const _DecoCircle({
    required this.size,
    required this.x,
    required this.y,
    required this.opacity,
    this.color = Colors.white,
  });

  final double size, x, y, opacity;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: x,
      top: y,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withOpacity(opacity),
        ),
      ),
    );
  }
}
