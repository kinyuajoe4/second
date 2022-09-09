import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:untitled/register.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
       options: DefaultFirebaseOptions.currentPlatform,
       );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: elc(),
  ));
}

class elc extends StatefulWidget {
  @override
  State<elc> createState() => _elcState();
}

class _elcState extends State<elc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Center(child: Text("Login Page")),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('images/logoo')),
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),
                    child: Image.asset(
                        'https://images.pexels.com/photos/35537/child-children-girl-happy.jpg?cs=srgb&dl=pexels-bess-hamiti-35537.jpg&fm=jpg')),
              ),
            ),
            User(),
            SizedBox(
              height: 20,
            ),
            Pass(),
            SizedBox(
              height: 20,
            ),
            Email(),
            TextButton(
              onPressed: () {},
              child: Text(
                'Forgot Password',
                style: TextStyle(color: Colors.brown, fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.brown, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade, child: reg()));
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 90,
            ),
            Hyper(),
            SizedBox(
              height: 50,
            ),

            /*Text('New User? Create Account')*/
          ],
        ),
      ),
    );
  }

  Widget User() => Padding(
      //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Username',
            hintText: 'Enter valid usernane as joseph'),
      ));

  Widget Pass() => Padding(
        padding:
            const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
        //padding: EdgeInsets.symmetric(horizontal: 15),
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
              hintText: 'Enter your password'),
        ),
      );

  Widget Email() => Padding(
        padding:
            const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
        //padding: EdgeInsets.symmetric(horizontal: 15),
        child: TextField(
          obscureText: false,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
              hintText: 'Enter your Email'),
        ),
      );

  Hyper() => GestureDetector(
        onTap: () {
          Navigator.push(context,
              PageTransition(type: PageTransitionType.bottomToTop, child: reg()));
        },
        child: RichText(
          text: TextSpan(
            text: 'New user?',
            style: TextStyle(color: Colors.black, fontSize: 15),
            children: const <TextSpan>[
              TextSpan(
                  text: 'New user?',
                  style: TextStyle(color: Colors.black, fontSize: 15)),
              TextSpan(
                  text: ' Register',
                  style: TextStyle(color: Colors.blue, fontSize: 15)),
            ],
          ),
        ),
      );
}
