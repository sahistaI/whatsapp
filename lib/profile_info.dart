import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp/chat_page.dart';

class ProfileInfo extends StatefulWidget{
  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {

  File? _profileImage;
  final TextEditingController nameController = TextEditingController();

  // Method to pick an image from gallery or camera

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery,
    maxWidth: 180,maxHeight: 180,imageQuality: 80,
    );
    if(pickedFile != null){
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }

  }
  @override
  void dispose(){
      nameController.dispose();
      super.dispose();
  }



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
              Text("Profile Info",style: TextStyle(
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
                child: Text("Please provide your name and an optional"
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
                  child: Text("profile photo"
                    ,style: TextStyle(
                        fontSize: 18,
                        color: Color(0XFF5E5E5E)
                    ),),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),

          GestureDetector(
            onTap: _pickImage ,
            child: CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey[300],
             backgroundImage: _profileImage != null ? FileImage(_profileImage!) : null,
              child: _profileImage == null ? Icon(Icons.camera_alt,
              color: Colors.grey[600],size: 40,) : null ,
            ),
          ),
         // SizedBox(height:10),

          Padding(
            padding: const EdgeInsets.all(30.0),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Type your name here',
                labelStyle: TextStyle(color: Colors.grey[600]),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0XFF00a884))
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0XFF00a884),
                  ),
                ),
                suffixIcon: Icon(
                  Icons.sentiment_satisfied_alt,
                  color: Colors.grey[600],
                )
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 250,),

          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor:Color(0XFF00a884),
                  minimumSize: Size(360.0, 50.0)
              ),

              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatPage()));
              }, child: Text("Next",style: TextStyle(
              fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white
          ),
          ))


        ],
      ),

    );
  }
}