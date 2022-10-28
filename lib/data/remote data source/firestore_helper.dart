import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:untitled/home.dart';
import 'package:firebase_core/firebase_core.dart';

import '../models/user_model.dart';

class firestorehelper{
  static Future create( UserModel user) async{

      final userCollection = FirebaseFirestore.instance.collection('users');
      final docRef = userCollection.doc();
     final newUser= UserModel(
       username:user.username,
       branch:user.branch,
       code:user.code,
       year:user.year,
     ).toJson();
    try{ await docRef.set(newUser);}catch(e){
      print('some error occured $e');
    }



  }
}