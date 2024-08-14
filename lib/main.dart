import 'home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
      const MaterialApp(debugShowCheckedModeBanner: false, home: TopTenApp()));
}

class TopTenApp extends StatefulWidget {
  const TopTenApp({super.key});

  @override
  State<TopTenApp> createState() => _TopTenAppState();
}

class _TopTenAppState extends State<TopTenApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star,
              size: 200,
            ),
            Text(
              'Cars',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              'V 0.1.1',
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
