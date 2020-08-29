import 'package:brew_crew/home/brew_list.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/services/database.dart';
import 'package:provider/provider.dart';
import 'package:brew_crew/models/brew.dart';


class Home extends StatelessWidget {

  final  AuthSerivce _auth = AuthSerivce();

  @override

  Widget build(BuildContext context) {

    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Text('bottom sheet'),
        );
      });
    }
    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
    child:Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title:Text("Brew Crew"),
      backgroundColor: Colors.brown[400],
      elevation:0.0,
      actions: [
        FlatButton.icon(onPressed:() async{
            await _auth.signOut();
        },
            icon:Icon(Icons.person),
            label:Text("log out")),

        FlatButton.icon(
            icon:Icon(Icons.settings),
            onPressed: () => _showSettingsPanel,
            label:Text('settings')
        )
      ],),

      body:BrewList(),
    ),
    );
  }
}
