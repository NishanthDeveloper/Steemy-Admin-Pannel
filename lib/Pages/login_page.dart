import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foxton_steemy_admin_pannel/Pages/landing_page.dart';
import 'package:foxton_steemy_admin_pannel/firebase/service/authservice.dart';
import 'package:foxton_steemy_admin_pannel/firebase/service/database_services.dart';
import 'package:foxton_steemy_admin_pannel/widgets/text_form_field.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  String email ="";
  String password = "";
  bool _isLoading = false;
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_isLoading ? Center(child:  SpinKitCubeGrid(
        color: Color(0xFFefcf18),
        size: 50.0,
      ),) : SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Center(
              child:Image.asset("assets/login.png"),
                ),
                SizedBox(height: 20,),
                Container(
                  width: 432,
                  child: TextFormField(

                    style:TextStyle(color: Colors.black),
                    decoration:textInputDecoration.copyWith(
                        labelText: "Email",
                        labelStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(Icons.email,color: Color(0xFFefcf18),)
                    ),
                    onChanged: (val){
                      setState(() {
                        email = val;
                        print(email);
                      });
                    },
                    validator: (value){
                      return RegExp(
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                          .hasMatch(value!) ? null : "Please enter the valid email";
                    },
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  width: 432,
                  child: TextFormField(
                    style:TextStyle(color: Colors.black),
                    obscureText: true,
                    decoration:textInputDecoration.copyWith(
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(Icons.lock,color: Color(0xFFefcf18),)
                    ),
                    validator: (val){
                      if(val!.length < 6){
                        return "Password must be at least 6 characters ";
                      }
                      else{
                        return null;
                      }
                    },
                    onChanged: (val){
                      setState(() {
                        password = val;
                        print(password);
                      });
                    },
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: 227,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: (){
                      login();
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xFF1E7001)
                    ),
                    child: Text("Sign In",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  ),
                ),
                SizedBox(height: 75,)
              ],
            ),
          ),
        ),
      ),
    );
  }
  void login() async{
    if(_formkey.currentState!.validate()){
      setState(() {
        _isLoading = true;
      });
      await authService.loginWithEmailandPassword( email, password).then((value)async{
        if(value == true){
          QuerySnapshot snapshot =     await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid).gettingUserData(email);

        Navigator.push(context,MaterialPageRoute(builder:(context)=>LandingPage()));
        }else{
          showSnackbar(context, value, Colors.red);
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }
}
