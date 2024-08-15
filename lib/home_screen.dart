import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:share_link/share_link.dart';

import 'about_screen.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List carList = [
    Car('Koenigsegg Jesko Absolut', '310MPH', 'Twin-Turbocharged V8',
        'assets/images/hor_koenigsegg.jpg', '???', '''
Koenigsegg is very good at making bonkers hypercars, and the Jesko Absolut is set to be the most insane offering yet. It uses a twin-turbocharged V8 engine which pushes 1,600hp when running on race fuel, and it’ll do 0-60mph in 2.5 seconds.
The Swedish brand also says that this car will do over 310mph, however this does come with a caveat. You see the Jesko Absolut has never actually hit this top speed in real life, these predictions are based on computer simulations, so time will tell if it can actually live up to these wild expectations.'''),
    Car('Bugatti Chiron Supersport 300+', '304MPH',
        '???', 'assets/images/hor_bugatti.jpg', '???', '''
Those who grew up in the 2000s will probably associate the fastest car in the world with the legendary Bugatti Veyron. Well that car’s spirit has been carried over to the Bugatti Chiron Supersport 300+; an 8.0-litre, quad-turbocharged, 1,600hp mega machine which will do, as the name suggests, over 300mph.
Specifically, it did 304mph when the French firm unleashed it at Volkswagen’s Ehra-Lessien test track. The Chiron 300+ doesn’t hold the official world record though, as it only did the run in one direction. To break the record you have to do it twice in opposite directions, which Bugatti decided not to do for some reason. A replacement for the Chiron is imminent, so maybe that car will be even faster still.'''),
    Car('SSC Tuatara', '331MPH', '???', 'assets/images/hor_ssc_tuatara.jpg',
        '???', '''
While the Bugatti Chiron’s complicated W16 engine is mightily impressive, sometimes you just can’t beat a whopping great V8 with a couple of turbos strapped to it. The SSC Tuatara (Too-ah-ta-ra) has a twin-turbocharged V8 which puts out up to 1,750hp when it’s running on ethanol, however there is some controversy around the official top speed.
You see, SSC claimed the Tuatara actually managed 331mph in October 2020 to make it the world’s fastest car — but later admitted to a GPS error that depicted that speed wrongly. Tests in early 2022 saw the car hit an actual top speed of 295mph, not exactly slow.'''),
    Car('Hennessey Venom F5', '272MPH', '???', 'assets/images/hor_hennessey.jpg',
        '???', '''
The folks in the USA are smashing the top speed game recently, with fourth place going to another all-American supercar. The Hennessey Venom F5 has a 6.6-litre twin-turbocharged V8 with 1,817hp and 1,617Nm of torque.
That’s enough to launch it from 0-60mph in 2.6 seconds, and it’ll go onto a top speed of 272mph – for now. Hennessey wants to get even more out of the F5, with the firm targeting a top speed of over 300mph in 2024'''),
    Car('Rimac Nevera', '256MPH', '???', 'assets/images/hor_rimac_nevera.jpg',
        '???',  '''
Electric cars offer instant acceleration thanks to the torque from their electric motors, however the added weight of the batteries can limit them in terms of top speed. This isn’t the case for the Rimac Nevera though.
This ballistic EV hypercar has four electric motors, producing a whopping 1,914hp and 2,300Nm of torque. That’s enough to launch it from 0-60mph in just 1.9 seconds, and it can go on to a top speed of 256mph. It’s made almost entirely out of carbon fibre to keep the weight down, but this isn’t just some stripped-out drag racer. The interior is a lovely place to be and you still get all the luxuries you’d expect of a car that costs £2 million.'''),
    Car( 'McLaren Speedtail', '250MPH', '???', 'assets/images/hor_mclaren.jpg',
        '???', '''
McLaren didn’t design the Speedtail to chase world records, but, with a 250mph top speed, it’s the fastest road car it has ever built.
That’s faster than its last three-seat car — the legendary McLaren F1. Its super-slippery bodywork lacks drag-inducing wings and means it looks like something ripped straight from a futuristic cyberpunk film. Just think about carrying two of your mates at that speed…'''),
    Car('Koenigsegg Regera', '250MPH', '???', 'assets/images/hor_koenigsegg_regera.jpg',
        '???', '''
Matching the Speedtail is the Koenigsegg Regera, the second car on this list from the Swedish brand. It touts a twin-turbo V8 engine and an electric motor that produce a total of 1,500hp.
Unlike any other car on this list, the Regera can go from 0-250mph using just one gear. Yep, no matter if you’re cruising at 30mph or aiming to hit its 250mph top speed (on a closed course, not the M1) you’ll be in the same gear. Seems a little bonkers.'''),
    Car('Aston Martin Valkyrie', '???MPH', '???', 'assets/images/hor_aston_martin.jpg',
        '???', '''
You may not think, based on appearances, that the Aston Martin Valkyrie is road legal. It might look like a full-blown LeMans racer, but you can really drive it on the street.
Mounted behind the driver is a 6.5-litre hybrid V12 with 1,160hp, capable of pushing this F1 inspired road-racer from 0-60mph in 2.5 seconds. Not really surprising when you realise that it weighs just over a tonne.'''),
    Car('Pagani Huayra', '238MPH', '???', 'assets/images/hor_pagani.jpg',
        '???', '''
The Pagani Huayra is a fantastic looking car. Every detail is exquisite, and it’s more than just a pin-up as well. It has an AMG derived twin-turbocharged V12 engine putting out 730hp and 1,000Nm of torque, enough for a top speed of 238mph.
The Huayra is made mostly of carbon fibre to keep the weight down, as well as to make it more rigid, and it’s covered in active aero to help it slip through the air more easily.'''),
    Car('Lamborghini Revuelto', '217MPH', '???', 'assets/images/hor_lambor.jpg',
        '???', '''
In a world of downsizing and forced induction, the lunatics at Lamborghini have stuck with a naturally aspirated V12 for its new flagship Revuelto. That’s not to say it’s completely unassisted, as you also get three electric motors to boost the power.
Specifically, you get a combined 1,015hp, more than any road-going Lamborghini ever made. 0-60mph is dealt with in 2.5 seconds, and it’ll go on to a top speed of 217mph.''')
  ];

//   List<Map<String, dynamic>> buttonList = [
//     {
//       'title': 'Koenigsegg Jesko Absolut',
//       'speed': '310MPH',
//       'icon': 'assets/images/hor_koenigsegg.jpg',
//       'image': '',
//       'description': '''
// Koenigsegg is very good at making bonkers hypercars, and the Jesko Absolut is set to be the most insane offering yet. It uses a twin-turbocharged V8 engine which pushes 1,600hp when running on race fuel, and it’ll do 0-60mph in 2.5 seconds.
// The Swedish brand also says that this car will do over 310mph, however this does come with a caveat. You see the Jesko Absolut has never actually hit this top speed in real life, these predictions are based on computer simulations, so time will tell if it can actually live up to these wild expectations.'''
//     },
//     {
//       'title': 'Bugatti Chiron Supersport 300+',
//       'speed': '304MPH',
//       'icon': 'assets/images/hor_bugatti.jpg',
//       'image': '',
//       'description': '''
// Those who grew up in the 2000s will probably associate the fastest car in the world with the legendary Bugatti Veyron. Well that car’s spirit has been carried over to the Bugatti Chiron Supersport 300+; an 8.0-litre, quad-turbocharged, 1,600hp mega machine which will do, as the name suggests, over 300mph.
// Specifically, it did 304mph when the French firm unleashed it at Volkswagen’s Ehra-Lessien test track. The Chiron 300+ doesn’t hold the official world record though, as it only did the run in one direction. To break the record you have to do it twice in opposite directions, which Bugatti decided not to do for some reason. A replacement for the Chiron is imminent, so maybe that car will be even faster still.'''
//     },
//     {
//       'title': 'SSC Tuatara',
//       'speed': '331MPH',
//       'icon': 'assets/images/hor_ssc_tuatara.jpg',
//       'image': '',
//       'description': '''
// While the Bugatti Chiron’s complicated W16 engine is mightily impressive, sometimes you just can’t beat a whopping great V8 with a couple of turbos strapped to it. The SSC Tuatara (Too-ah-ta-ra) has a twin-turbocharged V8 which puts out up to 1,750hp when it’s running on ethanol, however there is some controversy around the official top speed.
// You see, SSC claimed the Tuatara actually managed 331mph in October 2020 to make it the world’s fastest car — but later admitted to a GPS error that depicted that speed wrongly. Tests in early 2022 saw the car hit an actual top speed of 295mph, not exactly slow.'''
//     },
//     {
//       'title': 'Hennessey Venom F5',
//       'speed': '272MPH',
//       'icon': 'assets/images/hor_hennessey.jpg',
//       'image': '',
//       'description': '''
// The folks in the USA are smashing the top speed game recently, with fourth place going to another all-American supercar. The Hennessey Venom F5 has a 6.6-litre twin-turbocharged V8 with 1,817hp and 1,617Nm of torque.
// That’s enough to launch it from 0-60mph in 2.6 seconds, and it’ll go onto a top speed of 272mph – for now. Hennessey wants to get even more out of the F5, with the firm targeting a top speed of over 300mph in 2024'''
//     },
//     {
//       'title': 'Rimac Nevera',
//       'speed': '256MPH',
//       'icon': 'assets/images/hor_rimac_nevera.jpg',
//       'image': '',
//       'description': '''
// Electric cars offer instant acceleration thanks to the torque from their electric motors, however the added weight of the batteries can limit them in terms of top speed. This isn’t the case for the Rimac Nevera though.
// This ballistic EV hypercar has four electric motors, producing a whopping 1,914hp and 2,300Nm of torque. That’s enough to launch it from 0-60mph in just 1.9 seconds, and it can go on to a top speed of 256mph. It’s made almost entirely out of carbon fibre to keep the weight down, but this isn’t just some stripped-out drag racer. The interior is a lovely place to be and you still get all the luxuries you’d expect of a car that costs £2 million.'''
//     },
//     {
//       'title': 'McLaren Speedtail',
//       'speed': '250MPH',
//       'icon': 'assets/images/hor_mclaren.jpg',
//       'image': '',
//       'description': '''
// McLaren didn’t design the Speedtail to chase world records, but, with a 250mph top speed, it’s the fastest road car it has ever built.
// That’s faster than its last three-seat car — the legendary McLaren F1. Its super-slippery bodywork lacks drag-inducing wings and means it looks like something ripped straight from a futuristic cyberpunk film. Just think about carrying two of your mates at that speed…'''
//     },
//     {
//       'title': 'Koenigsegg Regera',
//       'speed': '250MPH',
//       'icon': 'assets/images/hor_koenigsegg_regera.jpg',
//       'image': '',
//       'description': '''
// Matching the Speedtail is the Koenigsegg Regera, the second car on this list from the Swedish brand. It touts a twin-turbo V8 engine and an electric motor that produce a total of 1,500hp.
// Unlike any other car on this list, the Regera can go from 0-250mph using just one gear. Yep, no matter if you’re cruising at 30mph or aiming to hit its 250mph top speed (on a closed course, not the M1) you’ll be in the same gear. Seems a little bonkers.'''
//     },
//     {
//       'title': 'Aston Martin Valkyrie',
//       'speed': '???MPH',
//       'icon': 'assets/images/hor_aston_martin.jpg',
//       'image': '',
//       'description': '''
// You may not think, based on appearances, that the Aston Martin Valkyrie is road legal. It might look like a full-blown LeMans racer, but you can really drive it on the street.
// Mounted behind the driver is a 6.5-litre hybrid V12 with 1,160hp, capable of pushing this F1 inspired road-racer from 0-60mph in 2.5 seconds. Not really surprising when you realise that it weighs just over a tonne.'''
//     },
//     {
//       'title': 'Pagani Huayra',
//       'speed': '238MPH',
//       'icon': 'assets/images/hor_pagani.jpg',
//       'image': '',
//       'description': '''
// The Pagani Huayra is a fantastic looking car. Every detail is exquisite, and it’s more than just a pin-up as well. It has an AMG derived twin-turbocharged V12 engine putting out 730hp and 1,000Nm of torque, enough for a top speed of 238mph.
// The Huayra is made mostly of carbon fibre to keep the weight down, as well as to make it more rigid, and it’s covered in active aero to help it slip through the air more easily.'''
//     },
//     {
//       'title': 'Lamborghini Revuelto',
//       'speed': '217MPH',
//       'icon': 'assets/images/hor_lambor.jpg',
//       'image': '',
//       'description': '''
// In a world of downsizing and forced induction, the lunatics at Lamborghini have stuck with a naturally aspirated V12 for its new flagship Revuelto. That’s not to say it’s completely unassisted, as you also get three electric motors to boost the power.
// Specifically, you get a combined 1,015hp, more than any road-going Lamborghini ever made. 0-60mph is dealt with in 2.5 seconds, and it’ll go on to a top speed of 217mph.'''
//     }
//   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'Top 10 fastest Cars',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          PopupMenuButton(
              color: Colors.red,
              iconColor: Colors.white,
              onSelected: (values) {
                switch (values) {
                  case 'Share the app':
                    setState(() {
                      ShareLink.shareUri(
                        Uri.parse('https://top_10_cars.com'),
                        subject: 'Share Top 10 fastest cars to your friends.',
                      );
                    });
                    break;
                  case 'About':
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AboutScreen(),
                        ));
                    break;
                  case 'Exit':
                    Navigator.pop(context);
                    exit(0);
                }
              },
              itemBuilder: (BuildContext context) {
                return {'Share the app', 'About', 'Exit'}.map((String choice) {
                  return PopupMenuItem(
                    value: choice,
                    child: ListTile(
                      iconColor: Colors.white,
                      leading: choice.contains('Share')
                          ? const Icon(Icons.share)
                          : choice == 'About'
                              ? const Icon(Icons.info)
                              : const Icon(Icons.directions_walk_outlined),
                      title: Text(
                        choice,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }).toList();
              })
        ],
      ),
      body: Stack(children: [
        Positioned.fill(
            child: Image.asset(
          'assets/images/ver_mclaren.jpg',
          fit: BoxFit.cover,
        )),
        Positioned.fill(
            child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            color: Colors.black.withOpacity(0),
          ),
        )),
        Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: carList.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: SizedBox(
                    width: 50,
                    height: 50,
                    child: ClipOval(
                      child: Image.asset(
                        carList[index].carImage,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    )),
                title: Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: Text(
                      carList[index].carName,
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                hoverColor: Colors.redAccent,
                tileColor: Colors.red,
                subtitle: Text(
                  '${carList[index].carDescription.toString().substring(0, 20)}...',
                  style: const TextStyle(color: Colors.white),
                ),
                horizontalTitleGap: 2,
                trailing: SizedBox(
                  width: 70,
                  child: Row(
                    children: [
                      Text(
                        carList[index].carSpeed,
                        style: const TextStyle(color: Colors.white),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailsScreen(carItem: carList[index])),

                    //Map Passed!
                    /*MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                              title: buttonList[index]['title'],
                              description: buttonList[index]['description'],
                              icon: buttonList[index]['icon'],
                            )),*/
                  );
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                height: 4,
                color: Colors.transparent,
              );
            },
          ),
        ),
      ]),
    );
  }
}

class Car {
  var carName;
  var carSpeed;
  var carEngine;
  var carImage;
  var carEnginePower;
  var carDescription;

  Car(this.carName, this.carSpeed, this.carEngine, this.carImage,
      this.carEnginePower, this.carDescription);
}
