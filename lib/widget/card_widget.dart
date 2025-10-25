import 'package:flutter/material.dart';

class card_widget extends StatelessWidget {
  const card_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(16),
                    topLeft: Radius.circular(5),
                  ),
                ),
                child: Icon(
                  Icons.calendar_today,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: const Text(
            "Trekking",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            children: const [
              Icon(Icons.location_on, color: Colors.amber, size: 16),
              Text(
                'Tours + Hotel',
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
              )
            ],
          ),
        )
      ],
    );
  }
}
