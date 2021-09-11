import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Loginbox extends StatelessWidget{

  final TextEditingController emailTextController;
  final TextEditingController passwordTextController;

  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding:EdgeInsets.fromLTRB(4, 0, 4, 15),
          child: Container(
            width:300,
            height: 50,
            decoration:BoxDecoration(
              color:Color(0xFFE0E0E0),
              borderRadius: BorderRadius.circular(25),
            ),
            child:Padding(
              padding:EdgeInsets.fromLTRB(20,0, 20, 0),
              child:TextFormField(
                controller: emailTextController,
                obscureText: false,
                decoration:InputDecoration(
                  hintText: 'email',
                  hintStyle: GoogleFonts.getFont("Open Sans", color: Color(0x7F455A64), fontWeight: FontWeight.normal,
                  ),
                  enabledBorder: null,
                ),
                style: GoogleFonts.getFont("Open Sans", color: Colors.black, fontWeight: FontWeight.normal,),
                )
              )
            )

          ),
        Padding(
            padding:EdgeInsets.fromLTRB(4, 0, 4, 15),
            child: Container(
                width:300,
                height: 50,
                decoration:BoxDecoration(
                  color:Color(0xFFE0E0E0),
                  borderRadius: BorderRadius.circular(25),
                ),
                child:Padding(
                    padding:EdgeInsets.fromLTRB(20,0, 20, 0),
                    child:TextFormField(
                      controller: passwordTextController,
                      obscureText: true,
                      decoration:InputDecoration(
                        hintText: 'password',
                        hintStyle: GoogleFonts.getFont("Open Sans", color: Color(0x7F455A64), fontWeight: FontWeight.normal,
                        ),
                      ),
                      style: GoogleFonts.getFont("Open Sans", color: Colors.black, fontWeight: FontWeight.normal,),
                    )
                )
            )

        ),
        Align(
          alignment: Alignment(0,0),
          child: Padding(
            padding: EdgeInsets.fromLTRB(4,0,4,15),
            child: Container(
                  width:300,
                  height: 50,
                  decoration:BoxDecoration(
                    color:Colors.yellow,
                    borderRadius: BorderRadius.circular(25),
                    gradient: null,
                    backgroundBlendMode: null
                  ),
                child: Column(
                  children: [
                    TextButton(
                        onPressed: null, //TODO
                        child: Text('Sign in', style: GoogleFonts.getFont("Open Sans", fontSize: 15, color: Colors.black, fontWeight: FontWeight.w700)),
                    )
                ])
            )
          )
        ),
        TextButton(
              onPressed: null,
              child:Text("Create an account", style: GoogleFonts.getFont("Open Sans"))
        )
      ],
    );
  }

  Loginbox(this.emailTextController, this.passwordTextController);

}