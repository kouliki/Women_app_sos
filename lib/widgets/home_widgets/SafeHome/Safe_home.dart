// import 'dart:js';

import 'package:flutter/material.dart';
class SafeHome extends StatelessWidget {

    void showModelSafeHome(BuildContext context) {
      showModalBottomSheet(
          context: context,
          builder: (context){
            return Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Container(
                height: MediaQuery.of(context).size.height/1.4,
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.only(
                     topRight: Radius.circular(20),
                     topLeft: Radius.circular(20),
                   )
                 ),
              ),
            );
          });



  }
  // const SafeHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showModelSafeHome(context),
      child: Card(
        elevation: 5,
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),

        ) ,
        child: Container(
          height: 100,
          width: MediaQuery.of(context).size.width*0.7,
          decoration: BoxDecoration(

          ),
          child: Row(
            children: [
              Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                ListTile(
                  title: Text('Send Location'),
                  subtitle: Text('Share Location'),


                ),

              ],)),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                  child: Image.asset('assets/route.jpg',height: 80,width: 80,)),
            ],
          ),
        ),

      ),
    );
  }
}
