import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String selectedGender = 'Men';
  String selectedSize = 'US 5.5';
  RangeValues selectedPriceRange = RangeValues(16, 350);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Filters',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                // Reset all filters to default
                selectedGender = 'Men';
                selectedSize = 'US 5.5';
                selectedPriceRange = RangeValues(16, 350);
              });
            },
            child: const Text(
              'RESET',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Gender',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: ['Men', 'Women', 'Unisex'].map((gender) {
                return ChoiceChip(
                  label: Text(gender),
                  selected: selectedGender == gender,
                  onSelected: (bool selected) {
                    setState(() {
                      selectedGender = gender;
                    });
                  },
                  selectedColor: Colors.blue,
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            const Text(
              'Size',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: ['UK 4.4', 'US 5.5', 'UK 6.5', 'EU 11.5'].map((size) {
                return ChoiceChip(
                  label: Text(size),
                  selected: selectedSize == size,
                  onSelected: (bool selected) {
                    setState(() {
                      selectedSize = size;
                    });
                  },
                  selectedColor: Colors.blue,
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            const Text(
              'Price',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            RangeSlider(
              values: selectedPriceRange,
              min: 16,
              max: 350,
              onChanged: (RangeValues values) {
                setState(() {
                  selectedPriceRange = values;
                });
              },
              activeColor: Colors.blue,
              labels: RangeLabels(
                '\$${selectedPriceRange.start.round()}',
                '\$${selectedPriceRange.end.round()}',
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Apply the filters and go back to the previous screen
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Apply',
                  style: TextStyle(fontSize: 18,color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
