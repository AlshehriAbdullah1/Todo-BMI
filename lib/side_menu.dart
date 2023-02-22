import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:rive/rive.dart';

import 'Info_card.dart';

class SideMenu extends StatelessWidget {
  SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(height: 250),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Notes'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/Todo');
              print('Notes clicked');
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('BMI Calculator'),
            onTap: () {
              print(Navigator.of(context).toString());
              //      print(ModalRoute.of(context).settings.name);
              Navigator.of(context).pushReplacementNamed('/BMI');
              print('BMI Clicked clicked');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Exit'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
              print('Exit Clicked clicked');
            },
          ),
        ],
      ),
    );
  }
}
