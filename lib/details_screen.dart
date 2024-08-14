import 'package:flutter/material.dart';
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
              Container(
                height: 150,
                width: double.infinity,
                color: Colors.yellow,
              ),
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
                          color: Colors.white70,
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
          Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                description,
                style: const TextStyle(fontSize: 18),
              )),
          ElevatedButton(
            onPressed: () {
              _launchURL('https://www.google.com/search?q=$title');
            },
            child: const Text(
              'More Details',
              style: TextStyle(fontSize: 20),
            ),
          )
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
