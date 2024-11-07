import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class VerifyNum extends StatefulWidget{
  @override
  State<VerifyNum> createState() => _VerifyNumState();
}

class _VerifyNumState extends State<VerifyNum> {

  final List<TextEditingController> otpControllers = List.generate(6, (index)=> TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Column(

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Verifying your number",style: TextStyle(
                  fontSize: 24,fontWeight: FontWeight.bold,
                  color: Color(0XFF00a884)
              ),),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text("You've tried to register +911234567890 "
                  ,style: TextStyle(
                      fontSize: 18,
                      color: Color(0XFF5E5E5E)
                  ),),
              ),

            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text("recently. Wait before requesting an SMS or Call."
                    ,style: TextStyle(
                        fontSize: 18,
                        color: Color(0XFF5E5E5E)
                    ),),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text("with your code."
                  ,style: TextStyle(
                      fontSize: 18,
                      color: Color(0XFF5E5E5E)
                  ),),
              ),
              Text("Wrong number?"
                ,style: TextStyle(
                    fontSize: 18,
                    color: Color(0XFF00a884)
                ),),
            ],
          ),
          SizedBox(
            height: 50,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:List.generate(6, (index){
              return Container(
                width: 50,
                child: TextField(
                  controller: otpControllers[index],
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  maxLength: 1,
                  decoration: InputDecoration(
                    counterText: "", /// Hide the length counter below the field
                    filled: true,
                  fillColor:Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Color(0XFF00a884)),
                      ),
                    ),
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black
                  ),

                  onChanged: (value) {

                  if (value.isNotEmpty){
                    // Automatic changed to the next field if a digit is entered
                    if(index<5){
                      FocusScope.of(context).nextFocus();
                    }
                  }
                  else{
                    if(index>0){
                      FocusScope.of(context).previousFocus();
                    }
                  }
                  },

                  ),


              );
            })
          ),
          SizedBox(height:30),

          GestureDetector(
            onTap: (){
              // Handle resend code logic
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Didn't receive code?",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0XFF00a884)
                ),),
              ],
            ),
          ),

          SizedBox(height:300),


          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor:Color(0XFF00a884),
                  minimumSize: Size(360.0, 50.0)
              ),

              onPressed: (){
                /// Implement verification logic here
               // print('Phone number: ${countryCode + phoneController.text}');

              }, child: Text("Next",style: TextStyle(
              fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white
          ),
          ))




        ],
      ),

    );
  }
}