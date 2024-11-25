// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:women_safety/utils/quotes.dart';

class custom_appbar extends StatelessWidget {
  // const custom_appbar({Key? key}) : super(key: key);

  Function? onTap;
  int? quoteIndex;

  custom_appbar({
    this.onTap,
    this.quoteIndex
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      /// to make the buttons clickable
        onTap: () {

            onTap!(); // Safely call the function only if it's not null

        },
        child: Container(
          child: Text(sweetSayings[quoteIndex!],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,

              )
          ),

        ),

    );
  }
}
