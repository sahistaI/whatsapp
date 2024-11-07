import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsapp/profile_info.dart';

class RegistrationPage extends StatefulWidget{
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  String selectedCountry = 'India';
  String countryCode = '+91';
  final phoneController = TextEditingController();

  final List<Map<String,String>> countries = [
    {'name': 'India', 'code': '+91'},
    {'name': 'United States', 'code': '+1'},
    {'name': 'United Kingdom', 'code': '+44 '},
  ];


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
              Text("Enter your phone number",style: TextStyle(
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
                child: Text("WhatsApp will need to verify your phone"
                    ,style: TextStyle(
                    fontSize: 18,
                    color: Color(0XFF5E5E5E)
                ),),
              ),

            ],
          ),
          Center(
            child: Text("number.Carrier charges may apply."
              ,style: TextStyle(
                  fontSize: 18,
                  color: Color(0XFF5E5E5E)
              ),),
          ),
          Center(
            child: Text("What's my number?"
              ,style: TextStyle(
                  fontSize: 18,
                  color: Color(0XFF00a884)
              ),),
          ),

          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                    child: DropdownButtonFormField<String>(
                      value: selectedCountry,

                      items:countries.map((country){
                        return DropdownMenuItem<String>(
                          value: country['name'],
                            child: Text(country['name']!),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCountry = value!;
                          countryCode = countries.firstWhere((country)=>country['name']==value)['code'].toString();
                        });
                      },

                    ),
                    ),

              ],
            ),
          ),
         // SizedBox(width: 10,),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              children: [
                // Country Code
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    readOnly: true,
                    initialValue: countryCode,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                     border: OutlineInputBorder(),
                    ),
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(width: 10),

                // Phone Number Input
                Expanded(
                  flex: 3,
                  child: TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Phone number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 280),


          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor:Color(0XFF00a884),
                  minimumSize: Size(360.0, 50.0)
              ),

              onPressed: (){
                /// Implement verification logic here
                
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileInfo()));
                print('Phone number: ${countryCode + phoneController.text}');

              }, child: Text("Next",style: TextStyle(
              fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white
          ),
          ))





        ],
      ),

    );
  }
}