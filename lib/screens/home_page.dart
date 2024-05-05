import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_x/bloc/weather_bloc.dart';
import 'package:weather_x/screens/components/weather_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 1.2 * kToolbarHeight, 0, 20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(-3, -0.3),
                  child: Container(
                    height: 100 ,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                       boxShadow: [
                         BoxShadow(
                           color: Color(0xFF7F00FF),
                           blurRadius: 100,
                           spreadRadius: 100,
                         ),
            ]
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, -1.2),
                  child: Container(
                    height: 300,
                    width: 600,
                    decoration: const BoxDecoration(
                        color: Color(0xFFE100FF)
                    ),
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.transparent),
                  ),
                ),
        BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if(state is WeatherSuccess){
             return SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child:
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '📍Indiranagar, Bangalore',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Good Morning',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Center(
                          child: Container(
                              height: 300,
                              child: getWeatherIcon(550)),
                        ) ,
                        Center(
                          child: Text(
                            '21 °C',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            "Light Rain",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Center(
                          child: Text(
                            DateFormat('EEEE dd •').add_jm().format(DateTime.now()),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w300
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/11.png',
                                  scale: 8,
                                ),
                                const SizedBox(width: 5),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Sunrise',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300
                                      ),
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      DateFormat().add_jm().format(DateTime.now()),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/12.png',
                                  scale: 8,
                                ),
                                const SizedBox(width: 5),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Sunset',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300
                                      ),
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      DateFormat().add_jm().format(DateTime.now()),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: Divider(
                            color: Colors.grey,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                                children: [
                                  Image.asset(
                                    'assets/13.png',
                                    scale: 8,
                                  ),
                                  const SizedBox(width: 5),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Temp Max',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300
                                        ),
                                      ),
                                      const SizedBox(height: 3),
                                      Text(
                                        "22 °C",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700
                                        ),
                                      ),
                                    ],
                                  )
                                ]
                            ),
                            Row(
                                children: [
                                  Image.asset(
                                    'assets/14.png',
                                    scale: 8,
                                  ),
                                  const SizedBox(width: 5),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Temp Min',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300
                                        ),
                                      ),
                                      const SizedBox(height: 3),
                                      Text(
                                        "21 °C",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700
                                        ),
                                      ),
                                    ],
                                  )
                                ]
                            )
                          ],
                        ),
                      ],
                    )
                ),
              );
            }
            else{
             return Container() ;
            }
          }
        )

              ],
            ),
          )),
    );
  }
}
