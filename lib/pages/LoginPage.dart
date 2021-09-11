import 'package:flutter/material.dart';
import 'package:frontend_movie_store/widget/LoginBox.dart';

class LoginPageWidget extends StatefulWidget{

  LoginPageWidget({Key? key}) : super(key:key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();

}

class _LoginPageWidgetState extends State<LoginPageWidget>{

  TextEditingController emailTextController=TextEditingController();
  TextEditingController passwordTextController=TextEditingController();
  bool passwordVisible=false;
  Key scaffoldKey=GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context){
    return Scaffold(
      key:scaffoldKey,
      body: Stack(
        children:[
        Align(
          alignment: Alignment(0,-1),
          child: Image.network("https://preview.redd.it/54qqo354uyy11.jpg?width=960&crop=smart&auto=webp&s=b6d6a073e45d4fdae16c61efa6d04eed8aedef3a",
          width: double.infinity,
          height: 250,
          fit: BoxFit.cover
          ),
        ),
        Align(
          alignment: Alignment(0,0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex:3,
                child: Padding(
                  padding:EdgeInsets.fromLTRB(0,180,0,0),
                  child: Container(
                    width:double.infinity,
                    height: 100,
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    child: Padding(
                      padding:EdgeInsets.fromLTRB(0,25,0,0),
                      child: SingleChildScrollView(
                        child:Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children:[
                            Padding(
                              padding:EdgeInsets.fromLTRB(0,0,0,12),
                              child:Image.network("https://cdn.freebiesupply.com/logos/large/2x/movie-city-logo-png-transparent.png",
                              width:120,
                              fit:BoxFit.cover)
                            ),
                            Loginbox(emailTextController,passwordTextController),
                          ]
                        )
                      )
                    )
                  )
                )
              )
            ],
          ),
        )
        ]
      )
    );
  }



}

