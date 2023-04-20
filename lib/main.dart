

import 'package:astrology_app/provider/them_provider.dart';
import 'package:astrology_app/views/HomePage.dart';
import 'package:astrology_app/views/splash_screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider<ThemProvider>(create: (context) => ThemProvider()),
          ],
           builder: (context, _){
             return  MaterialApp(
               debugShowCheckedModeBanner: false,
               theme: ThemeData.light(),
               darkTheme: ThemeData.dark(),
               themeMode: (Provider.of<ThemProvider>(context).themData.isDark)
                           ? ThemeMode.dark
                           : ThemeMode.light,
               initialRoute: 'splash_screens',
                 routes: {
                   '/':(context) => const HomePage(),
                   'splash_screens':(context) => const splash_screens(),
                 },
             );
           },
         ),
  );
}

