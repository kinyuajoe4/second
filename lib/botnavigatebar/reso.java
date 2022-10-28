import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/DBMIS/DBMIS%20PAGE.dart';
import 'package:untitled/EVENTS/NEWS.dart';
import 'package:untitled/home.dart';
import 'package:untitled/main.dart';
import 'package:untitled/register.dart';
import 'package:untitled/user%20detail.dart';
void main() => runApp(reso());

class reso extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _resoState();
  }
}

class _resoState extends State<reso> {
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
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:[
                    Text('ALL NEW RESOURCES APPEAR HERE:',style: TextStyle(color: Colors.brown,
                        letterSpacing: 4,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),)],
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 35.0),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://pbs.twimg.com/media/FFLheCWXsAEmRqE.jpg')),
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(150.0)),
                      ),
                        IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.brown,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => My()),
                            );
                          },
                        )],
                    ),
                  ),
                ),



              ],
            ),
          ),
        ));
  }}