import 'package:ball/constants.dart';
import 'package:ball/dragonball_page.dart';
import 'package:ball/onboardin_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            Constants.title,
            style: GoogleFonts.nabla(fontSize: 40, fontWeight: FontWeight.w600),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        backgroundColor: Constants.titleColor,
        centerTitle: true,
      ),
      backgroundColor: Constants.bgColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Lottie.asset('assets/lotties/goku_radar.json'),
              ),
              SizedBox(height: 20),
              FilledButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return OnBoardingPage();
                      },
                    ),
                  );
                },
                child: Text('Get Started', style: Constants.buttonText),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return DragonballPage();
                      },
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Try by searching 1 in the search box',
                        style: Constants.writeText,
                      ),
                      duration: Duration(seconds: 3),
                      backgroundColor: Constants.titleColor,
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.all(10),
                    ),
                  );
                },
                child: Text('Main Page', style: Constants.buttonText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
