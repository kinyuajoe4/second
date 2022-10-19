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
          bottomNavigationBar: BottomNavigationBar(

            items: const <BottomNavigationBarItem>[
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
              BottomNavigationBarItem(
                icon: Icon(Icons.camera, color: Colors.black,),
                label: 'Gallery',
              ),
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
                Text('LOGGED IN AS:',style: TextStyle(color: Colors.brown,
                letterSpacing: 4,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),
                Text(user.email!),
                Padding(
                    padding: const EdgeInsets.only(top: 60.0),
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
                              // do something
                            },
                          )],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),


              Details(),
                SizedBox(height: 20,),
                Details(),
                SizedBox(height: 20,),
                Details(),
                SizedBox(height: 20,),
                Details(),
                SizedBox(height: 50,),
                Getout()

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
  Widget Details()=>Container(
    height: 65,
    width: 360,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black38),
        color: Colors.white12,
        borderRadius: BorderRadius.circular(20)),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children:[Text('Name:',style: TextStyle(color: Colors.brown,
        fontSize: 17),),
    Text('Joseph Ndungu Kinyua')]),
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
      color:Colors.white,
    ),
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