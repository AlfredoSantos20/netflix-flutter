import 'package:flutter/material.dart';

class StoreCard extends StatefulWidget {
  final String imagePath;

  const StoreCard({super.key, required this.imagePath});

  @override
  _StoreCardState createState() => _StoreCardState();
}

class _StoreCardState extends State<StoreCard> {
  bool isFavorite = false; // Track the favorite state

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 5, spreadRadius: 2),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.asset(
              widget.imagePath,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 120,
                  width: double.infinity,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Text("Image not found", style: TextStyle(color: Colors.red)),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        "From AED 20",
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isFavorite = !isFavorite; // Toggle favorite state
                        });
                      },
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                const Text(
                  "The Bakery LLC & Cake Shop",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.access_time, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    const Text("09:00-16:00", style: TextStyle(fontSize: 12, color: Colors.grey)),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.star, size: 14, color: Colors.white),
                          SizedBox(width: 2),
                          Text("5.0", style: TextStyle(fontSize: 12, color: Colors.white)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    const Expanded(
                      child: Text(
                        "25 m - Al Barsha 1, Al Rabwah, Shop No. 11",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
