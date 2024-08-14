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
              Card(
                  color: Colors.white60,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ))
            ],
          ),
          Text(description),
          ElevatedButton(
            onPressed: () {
              _launchURL('https://www.google.com/search?q=' + title);
            },
            child: Text('More Details'),
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
