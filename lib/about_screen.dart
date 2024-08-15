import 'package:flutter/material.dart';

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
            Image.asset('assets/images/ver_mclaren.jpg'),
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
                    IconButton(onPressed: () {

                    }, icon: const Icon(Icons.call,color: Colors.white,))
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
