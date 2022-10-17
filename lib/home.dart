import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/main.dart';
void main() => runApp(hom());

class hom extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _homState();
  }
}

class _homState extends State<hom> {
  final user= FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.brown,
            title: Center(child: Text("home")),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Text('LOGGED IN AS'),
                Text(user.email!),

                TextButton(
                  onPressed: (){

                  },
                  child: Text(
                    'home',
                    style: TextStyle(color: Colors.brown, fontSize: 15),
                  ),

                ),
                SizedBox(
                  height: 100,
                ),
                TextButton(
                  onPressed: ()=> FirebaseAuth.instance.signOut(),
                  child: Text(
                    'log out',
                    style: TextStyle(color: Colors.brown, fontSize: 15),
                  ),
                ),],
            ),
          ),
        ));
  }
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
  Widget Pass2() => Padding(
    padding:
    const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
    //padding: EdgeInsets.symmetric(horizontal: 15),
    child: TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Confirm Password',
          hintText: 'Confirm your password'),
    ),
  );
  Widget Dev () =>Row(
    children: [
      IconButton(
        icon: Icon(
          Icons.login,
          color: Colors.white,
        ),
        onPressed: () {
          // do something
        },
      ),
      Divider(
        color: Colors.black,),
      IconButton(
        icon: Icon(
          Icons.exit_to_app,
          color: Colors.white,
        ),
        onPressed: () {
          // do something
        },
      ),
    ],
  );

}