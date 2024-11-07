import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 4,
    child:Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF008069),
        title: Text('WhatsApp', style:  TextStyle(
          fontSize: 22,color: Colors.white
        ),),
        actions: [
          IconButton(onPressed: (){

          }, icon: Icon(Icons.search,color:Colors.white ,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert,color:Colors.white)),
        ],

        bottom:
        TabBar(
        indicatorColor:Colors.white,
        labelColor:Colors.white,
        unselectedLabelColor: Colors.white,
        labelStyle:TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16
        ),
        unselectedLabelStyle:TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16
        ),

        tabs: [
          Tab(icon: Icon(Icons.camera_alt,color:Colors.white),),
          Tab(text: 'CHATS',),
          Tab(text: 'STATUS'),
          Tab(text: 'CALLS'),
        ],
      )
      ),

      body: TabBarView(
        children: [
          Center(child: Text('Camera View')),
          ChatList(),
          Center(child:Text('Status View')),
          Center(child:Text('Calls View')),
        ],
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FloatingActionButton(
            backgroundColor: Color(0xFF008069),
            onPressed: (){},
            child: Icon(Icons.message_sharp,
              color: Colors.white,size:25,),),
      )

    )
    );
  }
  
}

class ChatList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return ListView(
     children: [
       ListTile(
         leading: CircleAvatar(
           backgroundImage: AssetImage("assets/images/profile_1.png"),
         ),
         title: Text("Aron", style: TextStyle(
           fontWeight: FontWeight.bold
         ),),
         subtitle: Text('Lorem ipsum dolor sit'),
         trailing: Column(
           crossAxisAlignment: CrossAxisAlignment.end,
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text("5:27 am",style: TextStyle(
               color: Colors.grey
             ),),
             SizedBox(
               height: 4,
             ),
             Container(
               padding: EdgeInsets.all(6),
               decoration: BoxDecoration(
                 color: Color(0xFF25D366),
                 shape: BoxShape.circle,
               ),
               child: Text("8",style: TextStyle(
                 color: Colors.white
               ),),
             ),




           ],
         ),
       )
     ],
   );
  }
  
}

/*
void main(){
  runApp (MaterialApp(
    debugShowCheckedModeBanner: false,
  home: DefaultTabController(
    length: 4,
    child: ChatPage(),
  ),
  ));
}*/
