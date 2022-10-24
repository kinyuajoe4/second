import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  final String? username;
  final String? branch;
  final String? code;
  final String? year;


  UserModel({this.username,this.branch,this.code,this.year});
  factory UserModel.fromSnapshot(DocumentSnapshot snap){

    var snapshot = snap.data() as Map<String,dynamic>;
    return UserModel(
      username: snapshot['username'],
        branch: snapshot['branch'],
      code: snapshot['code'],
      year: snapshot['year']
    );
  }
  Map <String,dynamic>toJson()=>{
    "username":username,
    "branch":branch,
    "code":code,
    "year":year
  };

  toList() {}




}