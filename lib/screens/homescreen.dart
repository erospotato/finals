import 'package:finals/services/api_service.dart';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import '../widgets/promo_banner.dart';
import 'favorite_screen.dart';
import 'travel_screen.dart';
import 'profile_screen.dart';
import 'product_detail_screen.dart';
import '../widgets/free_shipping_banner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Product>> _productsFuture;
  final Set<int> _wishlist = {};
  int _currentIndex = 0;
  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _productsFuture = ApiService.fetchAll();
    _screens = [
      _shopBody,
      const FavoriteScreen(),
      const TravelScreen(),
      const ProfileScreen(),
    ];
  }

  void _toggleWishlist(int id) {
    setState(() {
      _wishlist.contains(id) ? _wishlist.remove(id) : _wishlist.add(id);
    });
  }

  void _retry() {
    setState(() {
      _productsFuture = ApiService.fetchAll();
    });
  }

  Widget get _shopBody => CustomScrollView(
    slivers: [
      SliverToBoxAdapter(child: const _Header()),

      SliverToBoxAdapter(child: const _SearchBar()),

      SliverToBoxAdapter(
        child: PromoBanner(
          tag: 'Summer Sale',
          headline: 'Up to 50% OFF',
          subtext: 'On selected items',

          imageUrl:
              "https://images.unsplash.com/photo-1518441902117-f0a8a1d1f0e3",

          onShopNow: () {},
        ),
      ),

      SliverToBoxAdapter(child: const _SectionTitle(title: 'Popular Products')),

      _ProductGrid(
        future: _productsFuture,
        wishlist: _wishlist,
        onWishlistToggle: _toggleWishlist,
        onRetry: _retry,
      ),

      SliverToBoxAdapter(child: const FreeShippingBanner()),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgPage,

      body: SafeArea(
        child: IndexedStack(index: _currentIndex, children: _screens),
      ),

      bottomNavigationBar: _BottomNav(
        selectedIndex: _currentIndex,

        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),

      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Row(
                  children: [
                    Text('Hello, Ratha ', style: AppTextStyles.heading1),

                    const Text('👋', style: TextStyle(fontSize: 22)),
                  ],
                ),

                const SizedBox(height: 4),

                Text('Find your best product', style: AppTextStyles.bodySmall),
              ],
            ),
          ),

          Stack(
            clipBehavior: Clip.none,

            children: [
              IconButton(
                onPressed: () {},

                icon: const Icon(
                  Icons.notifications_outlined,
                  color: AppColors.textSecondary,
                ),
              ),

              Positioned(
                right: 8,
                top: 6,

                child: Container(
                  width: 16,
                  height: 16,

                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),

                  child: const Center(
                    child: Text(
                      '3',

                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(width: 8),

          CircleAvatar(
            radius: 22,

            backgroundImage: const NetworkImage(
              'https://i.pravatar.cc/100?img=12',
            ),

            onBackgroundImageError: (_, __) {},
          ),
        ],
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

      child: Container(
        height: 50,

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(14),

          boxShadow: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
        ),

        child: const TextField(
          decoration: InputDecoration(
            hintText: 'Search products...',

            border: InputBorder.none,

            prefixIcon: Icon(Icons.search, color: Colors.grey),

            suffixIcon: Icon(Icons.tune_rounded, color: Colors.grey),

            contentPadding: EdgeInsets.symmetric(vertical: 14),
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Text(title, style: AppTextStyles.heading2),

          TextButton(
            onPressed: () {},

            child: const Text(
              'See all',

              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductGrid extends StatelessWidget {
  final Future<List<Product>> future;

  final Set<int> wishlist;

  final ValueChanged<int> onWishlistToggle;

  final VoidCallback onRetry;

  const _ProductGrid({
    required this.future,
    required this.wishlist,
    required this.onWishlistToggle,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: future,

      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SliverToBoxAdapter(
            child: SizedBox(
              height: 300,

              child: Center(child: CircularProgressIndicator()),
            ),
          );
        }

        if (snapshot.hasError) {
          return SliverToBoxAdapter(child: _ErrorState(onRetry: onRetry));
        }

        final products = snapshot.data!;

        return SliverPadding(
          padding: const EdgeInsets.all(16),

          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              final product = products[index];

              return ProductCard(
                product: product,

                isWishlisted: wishlist.contains(product.id),

                onWishlistToggle: () {
                  onWishlistToggle(product.id);
                },

                onTap: () {
                  Navigator.push(
                    context,

                    MaterialPageRoute(
                      builder: (_) => ProductDetailScreen(product: product),
                    ),
                  );
                },
              );
            }, childCount: products.length),

            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,

              crossAxisSpacing: 12,
              mainAxisSpacing: 12,

              childAspectRatio: 0.72,
            ),
          ),
        );
      },
    );
  }
}

class _ErrorState extends StatelessWidget {
  final VoidCallback onRetry;

  const _ErrorState({required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),

      child: Column(
        children: [
          const Icon(Icons.wifi_off_rounded, size: 48, color: Colors.grey),

          const SizedBox(height: 12),

          Text(
            'Failed to load products.\nCheck your connection.',

            textAlign: TextAlign.center,

            style: AppTextStyles.bodySmall,
          ),

          const SizedBox(height: 16),

          ElevatedButton.icon(
            onPressed: onRetry,

            icon: const Icon(Icons.refresh),

            label: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}

class _BottomNav extends StatelessWidget {
  final int selectedIndex;

  final ValueChanged<int> onTap;

  const _BottomNav({required this.selectedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,

      onTap: onTap,

      type: BottomNavigationBarType.fixed,

      selectedItemColor: AppColors.primary,
      unselectedItemColor: Colors.grey,

      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),

        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border_rounded),
          label: 'Favourite',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.card_travel_outlined),
          label: 'Travel',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline_rounded),
          label: 'Profile',
        ),
      ],
    );
  }
}
