import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:untitled/draggable.dart';
import 'package:untitled/home.dart';
import 'package:untitled/register.dart';
import 'package:untitled/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final navigatorKey= GlobalKey<NavigatorState>();
  FlutterNativeSplash.removeAfter(initialization);
  await Firebase.initializeApp(
       options: DefaultFirebaseOptions.currentPlatform,
       );
  runApp(MaterialApp(
    navigatorKey: navigatorKey,
    theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFEFEFEF)),
    debugShowCheckedModeBanner: false,
    home: elc(),
  ));
}
Future initialization(BuildContext?context)async{await Future.delayed(Duration(seconds: 3));}
class elc extends StatefulWidget {

  @override
  State<elc> createState() => _elcState();
}

class _elcState extends State<elc> {
   ValueNotifier<ThemeMode>  get _err => ValueNotifier(ThemeMode.light);
   final emailController= TextEditingController();
   final navigatorKey= GlobalKey<NavigatorState>();
   final passwordController= TextEditingController();
   final GlobalKey<FormState> _key= GlobalKey<FormState>();
   Future initialization(BuildContext?context)async{await Future.delayed(Duration(seconds: 3));}
  @override
  void dispose(){emailController.dispose();
   passwordController.dispose();
   super.dispose();}
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(child: Text("ELC DeKUT")),
      ),
      body:StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.connectionState== ConnectionState.waiting) return Center(child: CircularProgressIndicator(),);
          else if (snapshot.hasError) return Center(child: Text('KIMEUMANA'),);
          else if (snapshot.hasData){ return hom();}
          else
          return SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text('WELOME BACK',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.orangeAccent
                ),
                  ),
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child: Container(
                      width: 200,
                      height: 150,
                      child: Image.asset(
                          'images/helooo.png')),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              Email(),
              SizedBox(
                height: 20,
              ),
              Pass(),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.brown, borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: signIn,
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>hom()),
                  );
                },
                child: Text(
                  'Forgot Password',
                  style: TextStyle(color: Colors.brown, fontSize: 15),
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
      );}),
    );


  Widget User() => Padding(
      //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Username',
            hintText: 'Enter valid usernane as joseph'),
        cursorColor: Colors.cyan,
        textInputAction: TextInputAction.next,
      ));

  Widget Pass() => Padding(
        padding:
            const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
        //padding: EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          controller: passwordController,
          obscureText: true,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
              hintText: 'Enter your password'),
          cursorColor: Colors.cyan,
          textInputAction: TextInputAction.next,
        ),
      );

  Widget Email() => Padding(
        padding:
            const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
        //padding: EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          controller: emailController,validator: validateEmail,
          obscureText: false,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white
                )
              ),
              hintStyle: TextStyle(color: Colors.white),
              labelText: 'Email',
              hintText: 'Enter your Email'),
        ),
      );

  Hyper() => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => reg()),
          );
        },
        child: RichText(
          text: TextSpan(
            text: 'New user?',
            style: TextStyle(color: Colors.black, fontSize: 15),
            children: const <TextSpan>[
              TextSpan(
                  text: 'New user?',
                  style: TextStyle(color: Colors.brown, fontSize: 15)),
              TextSpan(
                  text: ' Register',
                  style: TextStyle(color: Colors.blue, fontSize: 15)),
            ],
          ),
        ),
      );
   Future signIn() async{ 
     showDialog(context: context, barrierDismissible: false, builder:(context)=>Center(child: CircularProgressIndicator(),));
     try{
     await FirebaseAuth.instance.signInWithEmailAndPassword(
         email: emailController.text.trim(),
         password: passwordController.text.trim());} on FirebaseAuthException catch(e){ print(e);}
navigatorKey.currentState!.popUntil((route)=>route.isFirst);
   }
}
String? validateEmail(String? formEmail){
  if (formEmail ==null|| formEmail.isEmpty)
    return'Email required';

  String pattern = r'\w+@\w+\.\w+';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formEmail)) return 'invalid email adresss';
  return null;
}
String? validatePassword(String? formPassword){
  if (formPassword ==null|| formPassword.isEmpty)
    return'Email required';
  String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regex = RegExp (pattern);
  if (!regex. hasMatch(formPassword))
    return '''Password must be at least 8 characters,
  include an uppercase letter, number and symbol.''';
  return null;


}