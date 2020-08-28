import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService
{

  final String uid;
  DatabaseService({this.uid});
  //collection refernce

  final CollectionReference brewCollection = Firestore.instance.collection('brewcrew');

  Future updateUserData(String sugars,String name,int length) async
  {
     return await brewCollection.document(uid).setData({

       'sugars':sugars,
       'name':name,
       'length':length,
     });
  }

  Stream<QuerySnapshot> get brews
  {
    return brewCollection.snapshots();
  }
}