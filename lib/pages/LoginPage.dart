import 'package:flutter/material.dart';
import 'package:frontend_movie_store/model/Model.dart';
import 'package:frontend_movie_store/model/objects/User.dart';
import 'package:frontend_movie_store/model/support/LogInResult.dart';
import 'package:frontend_movie_store/widget/LoginBox.dart';

class LoginPageWidget extends StatefulWidget {
  LoginPageWidget({Key key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  static User _user;
  static String text = "";
  bool _loading = false;
  static bool _logged = false;
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  bool passwordVisible = false;
  Key scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    if (!_logged) {
      return loginWidget();
    } else
      return profileWidget();
  }

  Widget profileWidget() {
    print(_user.username);
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black12,
          width: 1,
        ),
      ),
      child: SizedBox(
          width: double.infinity,
          height: 150,
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey.shade800,
                  backgroundImage: NetworkImage(
                      "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Hi, " + _user.username,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextButton(
                    onPressed: _logout,
                    child: Text(
                      "Logout",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          )),
    ));
  }

  Widget loginWidget() {
    return Scaffold(
        key: scaffoldKey,
        body: Stack(children: [
          Align(
            alignment: Alignment(0, 0),
            child: Image.network(
                "https://ncatregister.com/wp-content/uploads/2018/12/1_few-89t3Lc5M-WG4qQ8Uqg-900x360.jpeg",
                width: double.infinity,
                height: 100,
                fit: BoxFit.cover)
          ),
          Align(
            alignment: Alignment(0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                    flex: 3,
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 180, 0, 0),
                        child: Container(
                            width: double.infinity,
                            height: 300,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(0),
                            ),
                            child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                                child:Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                          padding:
                                          EdgeInsets.fromLTRB(0, 0, 0, 12),
                                          child: Image.network(
                                              "https://thumbs.dreamstime.com/b/movie-film-company-logo-design-vector-template-movie-film-company-logo-design-inspiration-vector-template-167661473.jpg",
                                              width: 120,
                                              fit: BoxFit.cover)),
                                      Loginbox(emailTextController,
                                          passwordTextController, _login),
                                    ]
                                )
                            )
                        )
                    )
                )
              ],
            ),
          )
        ]));
  }

  void _login() {
    setState(() {
      _loading = true;
    });
    Model.sharedInstance
        .logIn(emailTextController.text, passwordTextController.text)
        .then((result) {
      setState(() {
        print(result);
        print("");
        passwordTextController.clear();
        _loading = false;
        if (LogInResult.logged == result) {
          _logged = true;
          text = "welcome " + emailTextController.text;
          Model.sharedInstance
              .retrieveUserInfo(emailTextController.text)
              .then((result) {
            setState(() {
              _user = result;
            });
          });
          print(_user);
        }
        if (LogInResult.error_wrong_credentials == result) {
          _showDialog();
        }
      });
    });
  }

  void _logout() {
    Model.sharedInstance.logOut().then((value) {
      setState(() {
        _logged = false;
      });
    });
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Login error"),
            content: new Text("Wrong Credentials"),
            backgroundColor: Colors.white,
          );
        });
  } //_showDialog()

} //loginPage
