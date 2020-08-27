import 'package:flutter/material.dart';
import 'package:brew_crew/services/auth.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthSerivce _auth = AuthSerivce();
  final _formkey= GlobalKey<FormState>();

  //text setstate
  String email='';
  String password= '';
  String error='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor:Colors.brown[400],
        elevation: 0.0,
        title: Text("Sign Up"),
        actions: [FlatButton.icon(onPressed:(){

          widget.toggleView();
        },
            icon:Icon(
                Icons.person
            ),
            label:Text("Register"
            ))],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
          child:Form(
            key: _formkey,
            child: Column(
              children: [
                SizedBox(height: 20.0),
                TextFormField(
                  //validator: (val)=> val.isEmpty?"enter an email " :null,
                    validator: (val){
                      if(val.isEmpty)
                      {

                        return "email is required";

                      }

                      if (!RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                          .hasMatch(val))
                      {
                        return 'Please enter a valid email Address';
                      }

                      return null;
                    },
                  onChanged: (val){
                    setState(()=> email=val);
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  obscureText: true,
                  validator: (val)=>val.length < 6 ? "enter a password length of 6 character":null,
                  onChanged: (val)
                  {
                    setState(()=>password=val);
                  },
                ),
                SizedBox(height:20.0),
                RaisedButton(
                  color: Colors.pink[400],
                  child: Text("Register",
                    style: TextStyle(
                        color: Colors.white),
                  ),
                  onPressed: () async{

                    if(_formkey.currentState.validate())
                      {
                       dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                       if(result == null)
                         {
                            setState(()=>error='please enter a vaild email');
                         }
                      }
                    },
                ),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle( color: Colors.red,
                  fontSize: 14.0),
                )
              ],
            ),
          )
      ),
    );
}

}