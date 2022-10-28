import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:untitled/data/remote%20data%20source/firestore_helper.dart';
import 'package:untitled/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled/main.dart';
import 'package:untitled/register.dart';

import 'data/models/user_model.dart';

class My extends StatefulWidget {
  @override
  State<My> createState() => _MyState();
}

class _MyState extends State<My> {
  final ValueNotifier<ThemeMode> _noti = ValueNotifier(ThemeMode.light);

  bool isLoading = false;
  String errorMessage = '';

  /*@override
  void dispose() {
    _usernameController.dispose();
    _branchController.dispose();
    _codeController.dispose();
    _yearController.dispose();
  }*/


  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _noti,
      builder: (_, mode, __) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: mode, // Decides which theme to show, light or dark.
            home: Scaffold(
                body: SingleChildScrollView(
              child: Container(
                height: 800,
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    CircularProgressIndicator(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.brown,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => hom()),
                            );
                          },
                        ),
                        Text(
                          'EDIT YOUR PROFILE',
                          style: TextStyle(
                              fontSize: 20, color: Colors.orangeAccent),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.sunny_snowing,
                            color: Colors.brown,
                          ),
                          onPressed: () => _noti.value = mode == ThemeMode.light
                              ? ThemeMode.dark
                              : ThemeMode.light,
                        )
                      ],
                    ),
                    Space(),
                    SizedBox(
                      height: 30,
                    ),
                    UserN(),
                    SizedBox(
                      height: 30,
                    ),
                    Branch(),
                    SizedBox(
                      height: 30,
                    ),
                    Code(),
                    SizedBox(
                      height: 30,
                    ),
                    year(),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                       updateUser();
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => hom()),
                       );
                      },
                      child: Text('Save Changes'),
                    ),
                  ],
                ),
              ),
            )));
      },
    );
  }

  Widget UserN() => Padding(
      //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        controller: myEmail,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Username',
            hintText: 'Enter valid usernane as joseph'),
        cursorColor: Colors.cyan,
        textInputAction: TextInputAction.next,
      ));
  Widget Branch() => Padding(
      //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        controller: branch,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Branch',
            hintText: 'Enter your branch'),
        cursorColor: Colors.cyan,
        textInputAction: TextInputAction.next,
      ));
  Widget Code() => Padding(
      //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        controller: code,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Scholar code/PF number',
            hintText: 'Enter your code'),
        cursorColor: Colors.cyan,
        textInputAction: TextInputAction.next,
      ));
  Widget year() => Padding(
      //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        controller: Fyear,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Year of study',
            hintText: 'Enter your year of study'),
        cursorColor: Colors.cyan,
        textInputAction: TextInputAction.next,
      ));
  Widget Space() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          child: IconButton(
            icon: Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          ),
          decoration: BoxDecoration(
              color: Colors.brown, borderRadius: BorderRadius.circular(20)),
          height: 100.0,
          width: 100.0,
        ),
      );

  Future _create(String userId) async {
    setState(() => isLoading = true);
    try {
      final userCollection = FirebaseFirestore.instance.collection('users');
      final docRef = userCollection.doc(userId);
      await docRef.set({
        "username": "",
        "branch": "",
        "pfNO or code": "",
        "year of study": ""
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => hom()),
      );
      errorMessage = '';
    } on FirebaseFirestore catch (error) {
      errorMessage = errorMessage!;
    }
    setState(() => isLoading = false);
  }

  updateUser() async{
    print(userId);
    return await FirebaseFirestore.instance.collection('users').doc(userId).update({
      'email':myEmail.text,
      'uid':userId,
      'password':'',
      'branch':branch.text,
      'code':code.text,
      'year':Fyear.text
    });
  }
}
