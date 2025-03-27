import 'package:flutter/material.dart';

class CardProfile extends StatelessWidget {
  const CardProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/img1.png',
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    label: Text("Back", style: TextStyle(color: Colors.black)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 16,
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.favorite_border, color: Colors.black),
                      ),
                      SizedBox(width: 8),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.share, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                // Positioned(
                //   bottom: 16,
                //   left: 16,
                //   child: Chip(
                //     label: Text("Bakery", style: TextStyle(color: Colors.white)),
                //     backgroundColor: Colors.green,
                //   ),
                // ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.star, color: Colors.white, size: 16),
                        SizedBox(width: 4),
                        Text("5.0", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("The Bakery LLC & Cake Shop",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green)),
                  SizedBox(height: 8),
                  Text("One of the best finest Bakery Shop in Dubai.",
                      style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic)),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 18, color: Colors.black),
                      SizedBox(width: 8),
                      Text("Pickup Time: 09:00-16:00", style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 18, color: Colors.black),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text("25 m - Al Barsha 1, Al Rabwah, Shop No. 11",
                            style: TextStyle(color: Colors.black)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              color: Colors.grey[200],
              child: Text("Deals", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            _dealCard(
              title: "Salade",
              description: "Fresh organic Salade. 100% healthy and tasty. Natural body booster.",
              oldPrice: "AED 345",
              newPrice: "AED 54",
              imagePath: 'assets/images/img1.png',
              stockLabel: "Only 1 left",
              stockColor: Colors.yellow,
            ),
            _dealCard(
              title: "Pastries",
              description: "Fresh organic Salade. 100% healthy and tasty. Natural body booster.",
              oldPrice: "AED 345",
              newPrice: "AED 54",
              imagePath: 'assets/images/img1.png',
              stockLabel: "Sold Out",
              stockColor: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  Widget _dealCard({
    required String title,
    required String description,
    required String oldPrice,
    required String newPrice,
    required String imagePath,
    required String stockLabel,
    required Color stockColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          border: Border.all(color: Colors.amber, width: 1),
        ),
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: stockColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(stockLabel, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white)),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text(description, style: TextStyle(fontSize: 12, color: Colors.grey[700])),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text(oldPrice, style: TextStyle(fontSize: 12, color: Colors.grey, decoration: TextDecoration.lineThrough)),
                      SizedBox(width: 5),
                      Text(newPrice, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.red)),
                    ],
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