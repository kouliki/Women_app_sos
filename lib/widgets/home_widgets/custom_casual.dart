import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:women_safety/utils/quotes.dart';
import 'package:women_safety/widgets/home_widgets/safe_webview.dart';

class Customcarosal extends StatelessWidget {
  const Customcarosal({Key? key}) : super(key: key);

  void navigateToRoute(BuildContext context, Widget route) {
    Navigator.push(context, CupertinoPageRoute(builder: (context) => route));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
          items: List.generate(imageSliders.length,
                  (index) => Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: InkWell(
                      onTap: () {
                    //     if (index == 0) {
                    //       navigateToRoute(
                    //           context,
                        //       SafeView(
                        //           url:
                        //           "https://cmsadmin.amritmahotsav.nic.in/blogdetail.htm?75"));
                        // } else if (index == 1) {
                        //   navigateToRoute(
                        //       context,
                        //       SafeView(
                        //           url:
                        //           "https://plan-international.org/ending-violence/16-ways-end-violence-girls"));
                        // } else if (index == 2) {
                        //   navigateToRoute(
                        //       context,
                        //       SafeView(
                        //           url:
                        //           "https://www.healthline.com/health/womens-health/self-defense-tips-escape"));
                        // } else {
                        //   navigateToRoute(
                        //       context,
                        //       SafeView(
                        //           url:
                        //           "https://www.healthline.com/health/womens-health/self-defense-tips-escape"));
                        // }


                       } ,

                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          // gradient: LinearGradient(colors: [
                          //   Colors.black.withOpacity(0.5),
                          //
                          // ]),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                              image: NetworkImage(
                                imageSliders[index],
                              )
                          )
                        ),

                        child: Container(

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(colors: [
                                Colors.black.withOpacity(0.5),
                              Colors.transparent,

                              ]),
                          ),

                          child: Align(
                            alignment: Alignment.bottomLeft,

                            child: Padding(
                              padding: const EdgeInsets.only(bottom:8,left: 8 ),
                              child: Text(articleTitle[index],style: GoogleFonts.arefRuqaaInk(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: MediaQuery.of(context).size.width*0.05
                              ) ,),
                            ),
                          ),
                        ) ,

                      ),
                    ),
                  ),
          ) ,
          options: CarouselOptions(
            aspectRatio: 2.0,
            autoPlay: true,
            enlargeCenterPage: true,



          )) ,
    );
  }
}
