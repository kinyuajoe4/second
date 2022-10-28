import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/main.dart';
import 'package:untitled/register.dart';
import 'package:untitled/user%20detail.dart';
void main() => runApp(hom());

class hom extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _homState();
  }
}

class _homState extends State<hom> {

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
                  children:[  Dev(),
                    Text('LOGGED IN AS:',style: TextStyle(color: Colors.brown,
                  letterSpacing: 4,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),)],
                ),
                Text(user.email!),
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
                  SizedBox(
                    height: 40,
                  ),


              Name(),
                SizedBox(height: 20,),
                Branch(),
                SizedBox(height: 20,),
                ScholarCode(),
                SizedBox(height: 20,),
                Yearofstd(),
                SizedBox(
                  height: 40,
                ),
                Getout(),
                SizedBox(
                  height: 10,
                ),


              ],
            ),
          ),
        ));
  }
  Widget Getout()=>Container(
    height: 50,
    width: 200,
    decoration: BoxDecoration(
        color: Colors.brown,
        borderRadius: BorderRadius.circular(20)),
    child: TextButton(
      onPressed: (){
        setState(() {
          FirebaseAuth.instance.signOut();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => elc()),
          );
        });
      },
      child: Text(
        'log out',
        style: TextStyle(color: Colors.white, fontSize: 15),
      ),
    ),
  );
  Widget Name()=>Container(
    height: 60,
    width: 360,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black38),
        color: Colors.white12,
        borderRadius: BorderRadius.circular(20)),
    child: Row(

        mainAxisAlignment: MainAxisAlignment.start,
        children:[

          Text('Name:',style: TextStyle(color: Colors.brown,
        fontSize: 20),) ,
          FutureBuilder(
            future: fetch(),
            builder: (context, snapshot){
              return Text('${myEmail.text}',
              style: TextStyle(
                fontSize: 20,
                color: Colors.brown[800],
                fontWeight: FontWeight.bold

              ),);
            },
          )]),
  );
  Widget Branch()=>Container(
    height: 60,
    width: 360,
    decoration: BoxDecoration(
        border: Border.all(color: Colors.black38),
        color: Colors.white12,
        borderRadius: BorderRadius.circular(20)),
    child: Row(

        mainAxisAlignment: MainAxisAlignment.start,
        children:[

          Text('Branch:',style: TextStyle(color: Colors.brown,
              fontSize: 20),) ,
          FutureBuilder(
            future: fetch(),
            builder: (context, snapshot){
              return Text('${branch.text}',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.brown[800],
                    fontWeight: FontWeight.bold

                ),);
            },
          )]),
  );
  Widget ScholarCode()=>Container(
    height: 60,
    width: 360,
    decoration: BoxDecoration(
        border: Border.all(color: Colors.black38),
        color: Colors.white12,
        borderRadius: BorderRadius.circular(20)),
    child: Row(

        mainAxisAlignment: MainAxisAlignment.start,
        children:[

          Text('Scholar code:',style: TextStyle(color: Colors.brown,
              fontSize: 20),) ,
          FutureBuilder(
            future: fetch(),
            builder: (context, snapshot){
              return Text('${code.text}',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.brown[800],
                    fontWeight: FontWeight.bold

                ),);
            },
          )]),
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
  Widget User() => Padding(
    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Username',
            hintText: 'Enter valid usernane as joseph'),
      ));
  Widget Line()=>Padding(
    padding:EdgeInsets.symmetric(horizontal:10.0),
    child:Container(
      height:2.0,
      width:340.0,
      color:Colors.black54,),);
  Widget Space()=>Padding(
    padding:EdgeInsets.symmetric(horizontal:10.0),
    child:Container(
      height:55.0,
      width:150.0,
      color:Colors.black54,
    ),
  );
  Widget Yearofstd()=>Container(
    height: 60,
    width: 360,
    decoration: BoxDecoration(
        border: Border.all(color: Colors.black38),
        color: Colors.white12,
        borderRadius: BorderRadius.circular(20)),
    child: Row(

        mainAxisAlignment: MainAxisAlignment.start,
        children:[

          Text('Year of Study:',style: TextStyle(color: Colors.brown,
              fontSize: 20),) ,
          FutureBuilder(
            future: fetch(),
            builder: (context, snapshot){
              return Text('${Fyear.text}',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.brown[800],
                    fontWeight: FontWeight.bold

                ),);
            },
          )]),
  );
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
          color: Colors.brown,
        ),
        onPressed: () {
          // do something
        },
      ),
    ],
  );


}