import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:women_safety/Components/Primary_button.dart';
import 'package:women_safety/child/button_screens/contacts_page.dart';
import 'package:women_safety/db/db_services.dart';
import 'package:women_safety/model/contractsm.dart';

class AddContacts extends StatefulWidget {
  const AddContacts({Key? key}) : super(key: key);

  @override
  State<AddContacts> createState() => _AddContactsState();
}

class _AddContactsState extends State<AddContacts> {
  DatabaseHelper databaseHelper=DatabaseHelper();
  List<TContact> ?contactList=[];
  int count=0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            PrimaryButton(
                title: "Add Trusted Contacts",
                onPressed: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>ContactsPage(),
                    )
                  );
                },

            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: count,
                itemBuilder:(BuildContext context,int index){
                return Card(
                  child: ListTile(
                    title: Text(contactList![index].name),
                  ),
                );
                }
            )
          ],

        ),
      ),
    );
  }
}
