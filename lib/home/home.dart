import 'package:brew_crew/home/brew_list.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/services/database.dart';
import 'package:provider/provider.dart';


class Home extends StatelessWidget {

  final  AuthSerivce _auth = AuthSerivce();

  @override

  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
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
            label:Text("log out"))
      ],),

      body:BrewList(),
    ),
    );
  }
}
