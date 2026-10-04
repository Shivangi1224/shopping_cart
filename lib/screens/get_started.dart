import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'home/home_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3EFFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
              const SizedBox(height: 45),

              Text(
                'TreasureCart',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 45,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.5,
                  color: Colors.deepPurple,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                'Discover something worth grabbing.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade600,
                ),
              ),

              const SizedBox(height: 30),

              // Illustration
              Expanded(
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/treasure_cart.svg',
                    width: 360,
                  ),
                ),
              ),

              Text(
                'Find Your Next Treasure',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                'From everyday essentials to unexpected finds, '
                    'your next favorite product is waiting.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  height: 1.5,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 28),

              SizedBox(
                width: double.infinity,
                height: 58,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 28),
            ],
          ),
        ),
      ),
    );
  }
}