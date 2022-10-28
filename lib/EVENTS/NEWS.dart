import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/main.dart';
import 'package:untitled/register.dart';
import 'package:untitled/user%20detail.dart';
void main() => runApp(News());

class News extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewsState();
  }
}

class _NewsState extends State<News> {
  final user= FirebaseAuth.instance.currentUser!;

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