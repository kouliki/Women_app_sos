import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:women_safety/child/Bottom_screen.dart';
import 'package:women_safety/db/shared_prefrences.dart';
import 'package:women_safety/child/button_screens/child_home_page.dart';
import 'package:women_safety/child/child_login_screen.dart';
import 'package:women_safety/parent/Parent_Home_screen.dart';
import 'package:women_safety/utils/constants.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await MySharedPrefference.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.firaSansTextTheme(
          Theme.of(context).textTheme,
        ),
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
          future: MySharedPrefference.getUserType(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.data==""){
              return LoginScreen();
            }
            if(snapshot.data=="child"){
              return BottomPage();

            }
            if(snapshot.data=="parent"){
              return ParentHomeScreen();
            }
            return progressIndicator(context);
          }
      ),

      // MySharedPrefference.getUserType()=='child'
      //     ? home_screen()
      //     :MySharedPrefference.getUserType()=='Parent'
      //     ?ParentHomeScreen()
      //     :LoginScreen()
    );
  }
}

// class CheckAuth extends StatelessWidget {
//
//   checkData(){
//
//     if(MySharedPrefference.getUserType())
//   }
//   const CheckAuth({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//
//     );
//   }
// }
//
//
