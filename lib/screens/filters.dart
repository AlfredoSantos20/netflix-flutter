import 'package:ecom/components/navbar/custom_navbar.dart';
import 'package:flutter/material.dart';


class Filters extends StatefulWidget {
  const Filters({super.key});

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  int selectedIndex = 0; // Track selected tab

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  // Checkbox states
  bool isBakeryChecked = false;
  bool isRestaurantChecked = true;
  bool isGroceriesChecked = true;
  bool isOthersChecked = true;
  bool isVegetarianChecked = false;
  bool isVeganChecked = true;
  bool isGlutenFreeChecked = true;
  bool isLactoseFreeChecked = true;

  // Time range
  double startTime = 6.0;
  double endTime = 23.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F0),
      appBar: AppBar(
        backgroundColor: const Color(0xFF20402A),
        elevation: 0,
        automaticallyImplyLeading: true,
         iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Filters",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Category",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildCheckbox("Bakery", isBakeryChecked, (value) {
                  setState(() => isBakeryChecked = value);
                }),
                _buildCheckbox("Groceries", isGroceriesChecked, (value) {
                  setState(() => isGroceriesChecked = value);
                }),
              ],
            ),
            Row(
              children: [
                _buildCheckbox("Restaurant", isRestaurantChecked, (value) {
                  setState(() => isRestaurantChecked = value);
                }),
                _buildCheckbox("Others", isOthersChecked, (value) {
                  setState(() => isOthersChecked = value);
                }),
              ],
            ),

            const SizedBox(height: 16),

            const Text(
              "Dietary",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildCheckbox("Vegetarian", isVegetarianChecked, (value) {
                  setState(() => isVegetarianChecked = value);
                }),
                _buildCheckbox("Vegans", isVeganChecked, (value) {
                  setState(() => isVeganChecked = value);
                }),
              ],
            ),
            Row(
              children: [
                _buildCheckbox("Gluten Free", isGlutenFreeChecked, (value) {
                  setState(() => isGlutenFreeChecked = value);
                }),
                _buildCheckbox("Lactose Free", isLactoseFreeChecked, (value) {
                  setState(() => isLactoseFreeChecked = value);
                }),
              ],
            ),

            const SizedBox(height: 16),

            const Text(
              "Pick up hour",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("6h"),
                Expanded(
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      rangeThumbShape:
                          const RoundRangeSliderThumbShape(enabledThumbRadius: 10),
                      trackHeight: 4,
                    ),
                    child: RangeSlider(
                      min: 6.0,
                      max: 23.0,
                      values: RangeValues(startTime, endTime),
                      onChanged: (RangeValues values) {
                        setState(() {
                          startTime = values.start;
                          endTime = values.end;
                        });
                      },
                      activeColor: const Color(0xFF20402A),
                      inactiveColor: Colors.grey.shade300,
                    ),
                  ),
                ),
                const Text("23h"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("6:00 AM"),
                Text("2:00 PM"),
                Text("11:00 PM"),
              ],
            ),

            const SizedBox(height: 24),

            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      print("Apply Pressed");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF20402A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 14),
                    ),
                    child: const Text(
                      "Apply",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () {
                      print("Reset Pressed");
                    },
                    child: const Text(
                      "Reset",
                      style: TextStyle(
                        color: Color(0xFF20402A),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // 🔹 Custom Bottom Navigation Bar
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: selectedIndex,
        onItemTapped: onItemTapped,
      ),
    );
  }

  Widget _buildCheckbox(String title, bool value, Function(bool) onChanged) {
    return Expanded(
      child: Row(
        children: [
          Checkbox(
            value: value,
            onChanged: (newValue) => onChanged(newValue ?? false),
            activeColor: const Color(0xFF20402A),
          ),
          Text(title),
        ],
      ),
    );
  }
}
