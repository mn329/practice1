import 'package:flutter/material.dart';
import 'package:practice1/widget/card_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const _packages = <_PackageData>[
    _PackageData(
      title: 'Trekking',
      subtitle: 'Tours + Hotel',
      bannerColor: Color(0xFFE57373),
    ),
    _PackageData(
      title: 'Ice Climbing',
      subtitle: 'Tours + Gear',
      bannerColor: Color(0xFF4DD0E1),
    ),
    _PackageData(
      title: 'Forest Camping',
      subtitle: 'Guided Trails',
      bannerColor: Color(0xFFAED581),
    ),
    _PackageData(
      title: 'Summit Hike',
      subtitle: 'Meals Included',
      bannerColor: Color(0xFFFFB74D),
    ),
    _PackageData(
      title: 'River Crossing',
      subtitle: 'Tours + Safety Kit',
      bannerColor: Color(0xFF9575CD),
    ),
    _PackageData(
      title: 'Skyline Tour',
      subtitle: 'Helicopter Ride',
      bannerColor: Color(0xFFFF8A65),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: mediaQuery.size.height * 0.5,
            child: const DecoratedBox(
              decoration: BoxDecoration(
                color: Color(0xFF0F2940),
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _ActionBar(),
                  const SizedBox(height: 24),
                  Text(
                    'Mountain\nPackages',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _PackageColumn(
                          packages: _packages.sublist(0, 3),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const _SortBar(),
                            const SizedBox(height: 16),
                            _PackageColumn(
                              packages: _packages.sublist(3),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PackageColumn extends StatelessWidget {
  const _PackageColumn({
    required this.packages,
  });

  final List<_PackageData> packages;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < packages.length; i++) ...[
          CardWidget(
            title: packages[i].title,
            subtitle: packages[i].subtitle,
            bannerColor: packages[i].bannerColor,
          ),
          if (i != packages.length - 1) const SizedBox(height: 24),
        ],
      ],
    );
  }
}

class _ActionBar extends StatelessWidget {
  const _ActionBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _ActionButton(
          icon: Icons.chevron_left,
          onPressed: () {},
        ),
        _ActionButton(
          icon: Icons.search,
          onPressed: () {},
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: Colors.white,
        size: 30,
      ),
      splashRadius: 24,
      tooltip: icon == Icons.chevron_left ? 'Back' : 'Search',
    );
  }
}

class _SortBar extends StatelessWidget {
  const _SortBar();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Sort by',
              style: textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                  ) ??
                  const TextStyle(
                    color: Colors.white,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              'price',
              style: textTheme.titleMedium?.copyWith(
                    color: Colors.amber,
                    fontWeight: FontWeight.w600,
                  ) ??
                  const TextStyle(
                    color: Colors.amber,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_downward,
            color: Colors.white,
          ),
          splashRadius: 20,
          tooltip: 'Change sort order',
        ),
      ],
    );
  }
}

class _PackageData {
  const _PackageData({
    required this.title,
    required this.subtitle,
    required this.bannerColor,
  });

  final String title;
  final String subtitle;
  final Color bannerColor;
}
