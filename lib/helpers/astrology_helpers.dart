
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../modals/datamodal.dart';

class ZodicAPIHelper {
  ZodicAPIHelper._();

  static final ZodicAPIHelper zodicAPIHelper = ZodicAPIHelper._();

  Future<Zodic?> fetchingUserData({required String sign}) async {
    print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
    print(sign);
    http.Response response = await http.get(
      Uri.parse(
          "https://any.ge/horoscope/api/?sign=$sign&type=daily&day=today&lang=en"),
    );
    print("-------------------------");

    if (response.statusCode == 200) {
      List decodedData = jsonDecode(response.body);
      print("-------------------------");
      print(decodedData);

      Zodic zodic = Zodic(
        data: decodedData[0]["date"],
        discription: decodedData[0]["text"].split(">")[1].split("<")[0],
      );

      return zodic;
    }
    return null;
  }
}














// import 'dart:convert';
// import 'dart:developer';
// import 'package:http/http.dart' as http;
// import '../modals/astrology.dart';
//
// class HoroscopeApiHelper {
//   HoroscopeApiHelper._();
//
//   static final HoroscopeApiHelper horoscopeApiHelper = HoroscopeApiHelper._();
//
//   //Todo: Fetch love Data
//   Future<Horoscope?> todayLoveData({required String sunShineName,required String day}) async {
//
//     http.Response response = await http.get(
//         Uri.parse("https://astro-daily-live-horoscope.p.rapidapi.com/horoscope-love/$sunShineName/$day"),
//         headers: {
//           "X-RapidAPI-Key": "df304003camshe747a2d40a2a904p166caajsnb80009135309",
//           "X-RapidAPI-Host": "astro-daily-live-horoscope.p.rapidapi.com"
//         }
//     );
//     if(response.statusCode == 200)
//     {
//       Map decodedData = jsonDecode(response.body);
//
//       String data = decodedData[sunShineName];
//
//       Horoscope horoscope = Horoscope(data: data);
//
//       log(horoscope.data,name: "$sunShineName Data");
//
//       return horoscope;
//     }
//     return null;
//   }
//
//   //Todo: Fetch career Data
//   Future<Horoscope?> todayCareerData({required String sunShineName,required String day}) async {
//
//     http.Response response = await http.get(
//         Uri.parse("https://astro-daily-live-horoscope.p.rapidapi.com/horoscope-career/$sunShineName/$day"),
//         headers: {
//           "X-RapidAPI-Key": "df304003camshe747a2d40a2a904p166caajsnb80009135309",
//           "X-RapidAPI-Host": "astro-daily-live-horoscope.p.rapidapi.com"
//         }
//     );
//     if(response.statusCode == 200)
//     {
//       Map decodedData = jsonDecode(response.body);
//
//       String data = decodedData[sunShineName];
//
//       Horoscope horoscope = Horoscope(data: data);
//
//
//
//       return horoscope;
//     }
//     return null;
//   }
//
//
//   //Todo: Fetch today's Data
//   Future<Horoscope?> todayData({required String sunShineName,required String day}) async {
//
//     http.Response response = await http.get(
//         Uri.parse("https://astro-daily-live-horoscope.p.rapidapi.com/horoscope/$sunShineName/$day"),
//         headers: {
//           "X-RapidAPI-Key": "df304003camshe747a2d40a2a904p166caajsnb80009135309",
//           "X-RapidAPI-Host": "astro-daily-live-horoscope.p.rapidapi.com"
//         }
//     );
//     if(response.statusCode == 200)
//     {
//       Map decodedData = jsonDecode(response.body);
//
//       String data = decodedData[sunShineName];
//
//       Horoscope horoscope = Horoscope(data: data);
//
//
//
//       return horoscope;
//     }
//     return null;
//   }
//
//
// //Todo: Fetch Weekly data
//
// //Todo: Fetch Monthly Data
// }