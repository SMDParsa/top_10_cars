import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatelessWidget {
  final String title;
  final String icon;
  final String description;

  const DetailsScreen(
      {super.key,
      required this.title,
      required this.icon,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(icon),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        margin: const EdgeInsets.only(top: 30, left: 10),
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        )),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    margin: const EdgeInsets.only(top: 30),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        title,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          const Divider(
            color: Colors.white,
          ),
          Expanded(
            child: Stack(children: [
              Positioned.fill(
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 5),
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.7), BlendMode.srcATop),
                    child: Image.asset(
                      icon,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    textAlign: TextAlign.justify,
                    description,
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                right: 30,
                child: ElevatedButton(
                  onPressed: () {
                    _launchURL('https://www.google.com/search?q=$title');
                  },
                  child: const Text(
                    'More Details',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}

_launchURL(String goUrl) async {
  final Uri url = Uri.parse(goUrl.replaceAll(' ', '+'));
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
