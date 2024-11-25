import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:women_safety/widgets/home_widgets/Live_safe.dart';
import 'package:women_safety/widgets/home_widgets/SafeHome/Safe_home.dart';
import 'package:women_safety/widgets/home_widgets/custom_appbar.dart';
import 'package:women_safety/widgets/home_widgets/custom_casual.dart';
import 'package:women_safety/widgets/home_widgets/emergency.dart';

class home_screen extends StatefulWidget {
  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  // const home_screen({Key? key}) : super(key: key);
  int qIndex=0;

  getRandomQuote(){
    Random random= Random();
    setState(() {
      qIndex=random.nextInt(4);
    });
  }
  @override
  void initState() {
    getRandomQuote();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                custom_appbar(
                    quoteIndex:qIndex,
                  onTap: getRandomQuote(),

                ),
                Customcarosal(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Emergency',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ),
                Emergency(),
                Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                'Explore LiveSafe',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                ),
                LiveSafe(),
                SafeHome(),

    // LiveSafe(),

      ],
      ),
          ),
    ),
      ),
    );
  }
}
