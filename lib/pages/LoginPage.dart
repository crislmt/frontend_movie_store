import 'package:flutter/material.dart';
import 'package:frontend_movie_store/model/Model.dart';
import 'package:frontend_movie_store/model/support/LogInResult.dart';
import 'package:frontend_movie_store/widget/LoginBox.dart';


class LoginPageWidget extends StatefulWidget{

  LoginPageWidget({Key key}) : super(key:key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();

}

class _LoginPageWidgetState extends State<LoginPageWidget>{

  static String text="";
  bool _loading=false;
  static bool _logged=false;
  TextEditingController emailTextController=TextEditingController();
  TextEditingController passwordTextController=TextEditingController();
  bool passwordVisible=false;
  Key scaffoldKey=GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context){
    if(!_logged){
      return loginWidget();
    }
    return profileWidget();
  }

  Widget profileWidget(){
    return Scaffold(
      backgroundColor: Colors.pink,
    );
  }

  Widget loginWidget(){
    return Scaffold(
        key:scaffoldKey,
        body: Stack(
            children:[
              Align(
                alignment: Alignment(0,0),
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
                                                  child:Image.network("https://cdn.worldvectorlogo.com/logos/movie-city-1.svg",
                                                      width:120,
                                                      fit:BoxFit.cover)
                                              ),
                                              Loginbox(emailTextController,passwordTextController, _login),
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

  void _login(){
    setState(() {
      _loading=true;
    }); //setState()
    Model.sharedInstance.logIn(emailTextController.text, passwordTextController.text).then((result) {
      setState(() {
        print("Token requested succesfully");
        passwordTextController.clear();
        _loading=false;
        if(LogInResult.logged==result){
          _logged=true;
          text="welcome "+emailTextController.text;
        }
        if(LogInResult.error_wrong_credentials==result){
          _showDialog();
        }
      });
    });
  } //_login()

  void _logout(){
    Model.sharedInstance.logOut().then((value) {
      setState(() {
        _logged=false;
      });
    });
  }

  void _showDialog(){
    showDialog(
        context: context,
        builder:(BuildContext context){
          return AlertDialog(
            title: new Text("Attenzione!!"),
            content: new Text("Credenziali Sbagliate"),
            backgroundColor: Theme.of(context).primaryColor,

          );
        }
    );
  }//_showDialog()

}//loginPage

