import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/DBMIS/DBMIS%20PAGE.dart';
import 'package:untitled/EVENTS/NEWS.dart';
import 'package:untitled/home.dart';
import 'package:untitled/main.dart';
import 'package:untitled/register.dart';
import 'package:untitled/user%20detail.dart';

import '../RESOURCES/RESOURCE.dart';
void main() => runApp(nav());

class nav extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _navState();
  }
}

class _navState extends State<nav> {
  final user= FirebaseAuth.instance.currentUser!;
  int currentIndex =0;
  final Screens=[
    hom(),
    DBMIS(),
    News(),
    reso()
  ];


  fetch() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .get()
        .then((ds) {
      myEmail.text = ds['email'];
    }).catchError((e) {
      print(e);
      print("THe email is : ");
      print(myEmail.text);
    });
  }
  @override

  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            showUnselectedLabels: true,
            unselectedItemColor: Colors.cyan,
            selectedItemColor: Colors.black,
            currentIndex: currentIndex,
            onTap: (index)=>setState(()=> currentIndex= index),
            backgroundColor: Colors.cyan,


            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark,
                  color: Colors.black,),
                label: 'Resources',
              ),

              BottomNavigationBarItem(

                icon: Icon(Icons.people_outlined,
                  color: Colors.black,),
                label: 'DMIS',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notification_important, color: Colors.black,),
                label:('News'),

              ),
              /*BottomNavigationBarItem(
                icon: Icon(Icons.camera, color: Colors.black,),
                label: 'Gallery',
              ),*/
              BottomNavigationBarItem(
                icon: Icon(Icons.account_box_outlined, color: Colors.black,),
                label: 'Profile',
              ),
            ],
          ),
          body: Screens[currentIndex]
        ));
  }}