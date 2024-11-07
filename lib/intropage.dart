import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsapp/registration_page.dart';

class Intropage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children: [
          Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical:100),
                  child: Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image:DecorationImage(
                        image: AssetImage("assets/images/web_image.png"),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                ),
              ),
              Text("Welcome to WhatsApp",
              style: TextStyle(
                fontSize: 25,color: Colors.black
              ),),
              SizedBox(
                height: 25,
              ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Read Out",
                      style: TextStyle(
                          fontSize: 16,color: Colors.black
                      ),),
                  SizedBox(width:1,),
                    Text("Privacy Policy.",
                      style: TextStyle(
                          fontSize: 16,color: Colors.blue
                      ),),
                 //   SizedBox(width: 5,),
                    Text("Tap \"Agreement and continue\"",
                      style: TextStyle(
                          fontSize: 16,color: Colors.black
                      ),),
                  ],
                ),
              ),
              Row(
               mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("to accept the",
                    style: TextStyle(
                        fontSize: 16,color: Colors.black
                    ),),
                  SizedBox(width: 5,),
                  Text("Terms of Service.",
                    style: TextStyle(
                        fontSize: 16,color: Colors.blue
                    ),),
                ],
              ),
              SizedBox(
                height: 180,
              ),
              
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:Color(0XFF00a884),
                  minimumSize: Size(360.0, 50.0)
                ),

                  onPressed: (){

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrationPage()));


              }, child: Text("Agree and continue",style: TextStyle(
                fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white
              ),
              ))

            ],
          ),
        ],
      ),

    );
  }


}