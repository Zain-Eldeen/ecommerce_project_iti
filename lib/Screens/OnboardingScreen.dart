import 'package:e_commerce_app/Screens/loginScreen.dart';
import 'package:e_commerce_app/Widgets/onboardScreenWidget.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;
  late List<OnBoardingModel> onBoardingModellist;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() {
    onBoardingModellist = [
      OnBoardingModel(
          image: 'assets/images/1.png',
          title: "Start Journey\nWith Nike",
          discription: "Smart, Gorgeous & Fashionable Collection"),
      OnBoardingModel(
          image: 'assets/images/2.png',
          title: "Follow Latest\nStyle Shoes",
          discription:
              "There Are Many Beautiful And Attractive Plants To Your Room"),
      OnBoardingModel(
          image: 'assets/images/3.png',
          title: "Discover Best\nShoes",
          discription: "Comfortable and Stylish Shoes for Every Occasion"),
    ];
  }

  List<Widget> _buildPageContent() {
    return onBoardingModellist
        .map((model) => _buildOnboardingPage(
              model.image,
              model.title,
              model.discription,
            ))
        .toList();
  }

  Widget _buildOnboardingPage(String image, String title, String description) {
    return Stack(
      children: [
        // Background color
        Container(color: Colors.white),
        // Main content
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image at the top
              Expanded(
                flex: 2,
                child: Image.asset(image),
              ),
              const SizedBox(height: 20),
              // Title text
              Text(
                title,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              // Description text
              Text(
                description,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 40),
              // Button and Page Indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Page Indicator (only on pages 2 and 3)
                  if (currentPage != 0)
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: 3, // Number of pages
                      effect: CustomizableEffect(
                        activeDotDecoration: DotDecoration(
                          width:
                              20, // Make it more rectangular by increasing the width
                          height: 10,
                          color: Colors.blue, // Active dot color
                          borderRadius: BorderRadius.circular(
                              8), // Slightly rounded corners
                        ),
                        dotDecoration: DotDecoration(
                          width: 15, // Width of inactive dots
                          height: 8,
                          color: Colors.grey, // Inactive dot color
                          borderRadius: BorderRadius.circular(
                              6), // Slightly rounded corners
                        ),
                        spacing: 14, // Spacing between dots
                      ),
                    ),
                  // Button
                  ElevatedButton(
                    onPressed: () {
                      if (currentPage == 2) {
                        // Last page, navigate to HomeScreen
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      } else {
                        // Other pages, navigate to next page
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      currentPage == 0 ? 'Get Started' : 'Next',
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: onBoardingModellist.length,
            onPageChanged: (int page) {
              setState(() {
                currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              return _buildOnboardingPage(
                onBoardingModellist[index].image,
                onBoardingModellist[index].title,
                onBoardingModellist[index].discription,
              );
            },
          ),
        ],
      ),
    );
  }
}
