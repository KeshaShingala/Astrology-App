
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HomePage.dart';

class splash_screens extends StatefulWidget {
  const splash_screens({Key? key}) : super(key: key);

  @override
  State<splash_screens> createState() => _splash_screensState();
}

class _splash_screensState extends State<splash_screens> {

  logicIntro() async {
    final prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    logicIntro();
    Future.delayed(
      const Duration(seconds: 3),
          () => Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const HomePage())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
         Container(
           height: double.infinity,
             width: double.infinity,
             child: Image.asset("assets/images/background.jpg",fit: BoxFit.cover,)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60,),
              Container(
                alignment: Alignment.center,
                child: Image.asset("assets/images/vector.png"),
              ),
              SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text("Welcome",style: TextStyle(color: Colors.white,fontSize: 33,fontWeight: FontWeight.w500,letterSpacing: 2),),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text("Get involved in astrology with us",style: TextStyle(color: Colors.grey.shade300,fontSize: 20,),),
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text("astrology & horoscope",style: TextStyle(color: Colors.grey.shade300,fontSize: 22,letterSpacing: 1,fontWeight: FontWeight.w400
                ),),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
