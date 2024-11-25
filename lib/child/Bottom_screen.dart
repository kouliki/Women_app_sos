import 'package:flutter/material.dart';
import 'package:women_safety/child/button_screens/add_contacts.dart';
import 'package:women_safety/child/button_screens/chat_screen.dart';
import 'package:women_safety/child/button_screens/child_home_page.dart';
import 'package:women_safety/child/button_screens/contacts_page.dart';
import 'package:women_safety/child/button_screens/profile_page.dart';
import 'package:women_safety/child/button_screens/review_page.dart';
class BottomPage extends StatefulWidget {
  const BottomPage({Key? key}) : super(key: key);

  @override
  State<BottomPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  int currIndex=0;

  List<Widget> pages=[
    home_screen(),
    AddContacts(),
    ChatsScreen(),

    Profile_page(),
    // ContactsPage(),
    ReviewPage(),
  ];
  onTapped(int index){
    setState(() {
      currIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:currIndex ,
        type: BottomNavigationBarType.shifting,
        onTap: onTapped,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.redAccent,
            label: 'home',
              icon:Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            label: 'Contacts',
              icon:Icon(Icons.contacts)
          ),
          BottomNavigationBarItem(
            label: 'Chats',
              icon:Icon(Icons.chat)
          ),
          BottomNavigationBarItem(
            label: 'profile',
              icon:Icon(Icons.person)
          ),
          BottomNavigationBarItem(
            label: 'Reviews',
              icon:Icon(Icons.reviews)
          ),
        ],
      ),

    );
  }
}
