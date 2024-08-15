import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'home_screen.dart';

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
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initPackageInfo();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
    });
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  Widget _infoTile(String title, String subtitle) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle.isEmpty ? 'Not set' : subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 150,
                height: 150,
                child: Image.asset('assets/images/ic_launcher.png')),
            Text(
              _packageInfo.appName,
              style: TextStyle(fontSize: 30),
            ),
            Text(
              'V ${_packageInfo.version} Build ${_packageInfo.buildNumber}',
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
