import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:top_10_cars/home_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatelessWidget {
  final Car carItem;

  const DetailsScreen({super.key, required this.carItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(carItem.carImage),
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
                        carItem.carName,
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
                      carItem.carImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GridView.builder(
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          var carInfo;
                          var icon;

                          switch (index) {
                            case 0:
                              icon = Icons.speed;
                              carInfo = carItem.carSpeed;
                              break;
                            case 1:
                              icon = Icons.settings;
                              carInfo = carItem.carEngine;
                              break;
                            case 2:
                              carInfo = carItem.carEnginePower;
                              icon = Icons.bolt;
                          }
                          return Column(
                            children: [
                              Icon(
                                icon,
                                color: Colors.white,
                                size: 40,
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                '$carInfo',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          );
                        },
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                      ),
                      Text(
                        carItem.carDescription,
                        textAlign: TextAlign.justify,
                        style:
                            const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                right: 30,
                child: ElevatedButton(
                  onPressed: () {
                    _launchURL(
                        'https://www.google.com/search?q=${carItem.carName}');
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
