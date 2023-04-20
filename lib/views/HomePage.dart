import 'package:astrology_app/untile/globals.dart';
import 'package:astrology_app/views/nextpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/them_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      body:Container(
        height: height,
        width: width,
        child: Container(
          height: height,
          width: width,
          color: Color(0XFF181727).withOpacity(0.7),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
              Row(
                children: [
                  Expanded(
                    flex: 12,
                    child:   Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 20,),
                          Icon(Icons.search,color: Colors.white,),
                          SizedBox(width: 20,),
                          Text("search",style: TextStyle(color: Colors.white,fontSize: 20),),
                        ],
                      ),
                    ),
                  ),),
                 Expanded(
                   flex: 2,
                   child:  IconButton(
                   onPressed: () {
                     Provider.of<ThemProvider>(context,listen: false).them();
                   },
                   icon: const Icon(
                     Icons.light_mode,
                     color: Colors.white,),),),
                ],
              ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 750,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount:  sunsignList.length,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 15,right: 15,bottom: 30),
                        child: Container(
                          height: 250,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white70,width: 2),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 10,),
                              Image.asset(sunsignList[i].image2,height: 150,width: 150,color: Colors.grey.shade300,),
                              SizedBox(height: 10,),
                              InkWell(
                               onTap: () {
                                 Navigator.push(
                                   context,
                                   MaterialPageRoute(
                                     builder: (context) => nextpage(index: i, name: sunsignList[i].name, image: sunsignList[i].image, image2: sunsignList[i].image2),
                                        ),
                                     );
                                  },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.white70),
                                  ),
                                  child:  Text("${sunsignList[i].name}",style: TextStyle(color: Colors.grey.shade300,fontSize: 22,fontWeight: FontWeight.w600),),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
