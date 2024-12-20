import 'package:flutter/cupertino.dart';

import 'Emergencies/Ambulanceemergency.dart';
import 'Emergencies/FirebridgeEmergency.dart';
import 'Emergencies/policeEmergency.dart';

class Emergency extends StatelessWidget {
  const Emergency({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      width: MediaQuery.of(context).size.width,
      height: 180,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          PoliceEmergency(),
          AmbulanceEmegency(),
          FirebridgeEmergency(),

        ],
      ),
    );
  }
}
