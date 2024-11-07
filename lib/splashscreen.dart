import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/intropage.dart';

class Splashscreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds:5),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Intropage()));
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 83,
              height: 83,
              child: Center(
                child:Image.asset("assets/images/whatsapp_logo.png",fit: BoxFit.cover,),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("WhatsApp",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),)
          ],
        ),
      ),
    );
  }

  
}