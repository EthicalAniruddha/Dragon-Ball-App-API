import 'dart:developer';

import 'package:ball/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Info extends StatelessWidget {
  const Info({super.key});

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'This is my first time using API.',
              style: Constants.writeText,
            ),
            SizedBox(height: 20),
            Text(
              'The language may not be familiar with you.',
              style: Constants.writeText,
            ),
            SizedBox(height: 20),
            Text('I have used this website', style: Constants.writeText),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                String url = 'https://web.dragonball-api.com/';
                try {
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(
                      Uri.parse(url),
                      mode: LaunchMode.inAppBrowserView,
                    );
                  }
                } catch (e) {
                  log(e.toString());
                }
              },
              child: Text('Open Website', style: Constants.buttonText),
            ),
          ],
        ),
      ),
    );
  }
}
