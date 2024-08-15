import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
        title: const Text(
          'About',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/ver_mclaren.jpg',
              fit: BoxFit.cover,
            ),
            Positioned.fill(
                child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                color: Colors.white.withOpacity(0),
              ),
            )),
            Container(
              padding: const EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Show picture and name
                  Row(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50)),
                            child: Image.asset('assets/images/my_pic.jpg')),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Column(
                        children: [
                          Text(
                            'AbdulSamad Akrampur',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(
                            'Developer, Programmer, Designer',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Lorem Ipsom dolor, a lazy dog jumps over the fast fox!,Lorem Ipsom dolor, a lazy dog jumps over the fast fox! Lorem Ipsom dolor, a lazy dog jumps over the fast fox!Lorem Ipsom dolor, a lazy dog jumps over the fast fox!,Lorem Ipsom dolor, a lazy dog jumps over the fast fox!, Lorem Ipsom dolor, a lazy dog jumps over the fast fox!.\nLorem Ipsom dolor, a lazy dog jumps over the fast fox!Lorem Ipsom dolor, a lazy dog jumps over the fast fox! Lorem Ipsom dolor, a lazy dog jumps over the fast fox!',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
            Positioned(
                bottom: 20,
                right: 0,
                left: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          _urlLauncher('tel:+93785287051');
                        },
                        icon: const Icon(
                          Icons.call,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {
                          _urlLauncher('https://t.me/smdparsa');
                        },
                        icon: const Icon(
                          Icons.telegram,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {
                          _urlLauncher(
                              'mailto:ap.smdsoft@gmail.com?subject=Top 10 fastest cars&body=This is a test from top 10 fastest cars in the world app created with flutter by AbdulSamad!');
                        },
                        icon: const Icon(
                          Icons.email,
                          color: Colors.white,
                        )),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

_urlLauncher(String goUrl) async {
  final Uri url = Uri.parse(goUrl);
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
