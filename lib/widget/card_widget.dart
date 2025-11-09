import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    required this.title,
    required this.subtitle,
    required this.bannerColor,
    this.trailingIcon = Icons.calendar_today,
    super.key,
  });

  final String title;
  final String subtitle;
  final Color bannerColor;
  final IconData trailingIcon;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: bannerColor,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(16),
                    topLeft: Radius.circular(5),
                  ),
                ),
                child: Icon(
                  trailingIcon,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ) ??
              const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            const Icon(
              Icons.location_on,
              color: Colors.amber,
              size: 16,
            ),
            const SizedBox(width: 4),
            Text(
              subtitle,
              style: textTheme.bodyMedium?.copyWith(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ) ??
                  const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
