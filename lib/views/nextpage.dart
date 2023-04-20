import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../helpers/astrology_helpers.dart';
import '../modals/datamodal.dart';
import '../provider/them_provider.dart';


class nextpage extends StatefulWidget {
  nextpage({Key? key , required this.index, required this.name, required this.image,required this.image2}) : super(key: key);

  int index;
  String name;
  String image;
  String image2;

  @override
  State<nextpage> createState() => _nextpageState();
}

class _nextpageState extends State<nextpage> {
  DateTime date = DateTime.now();
  List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      body: Column(
        children: [
          SizedBox(height: 35,),
               Row(
                 children: [
                   Spacer(),
                   IconButton(
                    onPressed: () {
                      Provider.of<ThemProvider>(context,listen: false).them();
                    },
                    icon: const Icon(
                      Icons.light_mode,
                      color: Colors.white,
                    )),
                   SizedBox(width: 20,),
                 ],
               ),
          Container(height: 1,color: Colors.white,),
          Image.asset(widget.image2,height: 300,width: 300,color: Colors.grey.shade400,),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Image.asset(widget.image,height: 35,width: 35,color: Colors.white,),
              SizedBox(width: 25,),
              Text(widget.name,style: TextStyle(color: Colors.grey.shade300,fontSize: 30,fontWeight: FontWeight.w600),),
          ],),
          SizedBox(height: 40,),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text("${months[date.month]} ${date.day}, ${date.year}",
                    style: TextStyle(color: Colors.grey.shade300,fontWeight: FontWeight.w600,fontSize: 17,letterSpacing: 1)),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),

                  FutureBuilder(
                    future: ZodicAPIHelper.zodicAPIHelper
                        .fetchingUserData(sign: widget.name),

                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        print(widget.name);
                        print(snapshot.error);
                        return  Text(
                            "Error :  ${snapshot.error}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600));
                      } else if (snapshot.hasData) {
                        print(snapshot.data);
                        print("###############################");
                        print(widget.name);
                        Zodic? data = snapshot.data as Zodic?;
                        print("=========================");
                        print(data);

                        return Column(
                          children: [
                            Text(data!.data,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600)),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              data.discription,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        );
                      }
                      return const CircularProgressIndicator(
                          color: Colors.white);
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
