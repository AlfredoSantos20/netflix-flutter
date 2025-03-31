import 'package:ecom/components/cards/card_profile.dart';
import 'package:ecom/components/navbar/custom_navbar.dart';
import 'package:ecom/screens/filters.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom/components/cards/store_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F0),
      appBar: AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      centerTitle: true,
      title: const Text(
        "FoodyHub",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color:  Color(0xFF20402A),
            ),
          ),
      ),
      body: SingleChildScrollView(
      //  physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                
                  ElevatedButton(
                    onPressed: () {
                      print("Store List Pressed!");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF20402A), // Dark Green
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    ),
                    child: const Text(
                      "Store List",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 24), // Space between buttons

                
                  OutlinedButton(
                    onPressed: () {
                      print("See on Map Pressed!");
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF20402A)), // Dark Green Border
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    ),
                    child: const Text(
                      "See on map",
                      style: TextStyle(fontSize: 14, color: Color(0xFF20402A)),
                    ),
                  ),
                ],
              ),
            ),

             

              const SizedBox(height: 24), 
              // 🔹 Search Bar
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.filter_list, color: Colors.black),
                      onPressed: () {
                         Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Filters()),
                    );
                      },
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // 🔹 New on Foody Section
              const Text(
                "New on FoodyHub",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

             
  SizedBox(
  width: MediaQuery.of(context).size.width,
  height: 300, 
  child: CarouselSlider(
    options: CarouselOptions(
      height: 300, // Adjusted height
      autoPlay: true,
      enlargeCenterPage: true,
      viewportFraction: 0.9, 
    ),
    items: [
      "assets/images/img1.png",
      "assets/images/img2.png",
      "assets/images/img3.png"
    ].map((imagePath) {
      return GestureDetector(
        onTap: () {
          // Navigate to store details or perform an action
         Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CardProfile()),
          );
        },
        child: SizedBox(
          height: 200, 
          child: StoreCard(imagePath: imagePath),
        ),
      );
    }).toList(),
  ),
),


              const SizedBox(height: 20),


              const Text(
                "Around You",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Column(
                children: 
                const [
                  StoreCard(imagePath: "assets/images/img1.png"),
                  StoreCard(imagePath: "assets/images/img2.png"),
                  StoreCard(imagePath: "assets/images/img3.png"),
                ],
              ),
            ],
          ),
        ),
      ),

      // 🔹 Custom Bottom Navigation Bar
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
