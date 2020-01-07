import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ud_flutter_firestore_complexa/Pages/ItemOne.dart';
import 'package:ud_flutter_firestore_complexa/Pages/ItemTwo.dart';
import 'package:ud_flutter_firestore_complexa/Pages/ItemThree.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {

  int _indexpage = 1;

  final pageOptions = [
    ItemOne(),
    ItemTwo(),
    ItemThree()
  ];





  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: AppBar(
        title: Text("Compleax App"),
        backgroundColor: Colors.deepOrange,
      ),


      drawer: Drawer(
        child: ListView(
          children: <Widget>[

            UserAccountsDrawerHeader(
              accountEmail: null,
              accountName: Text("Complex App",
              style: TextStyle(
                fontSize: 20.0
              ),
              ),
              decoration: BoxDecoration(
                color: Colors.deepOrange
              ),
            ),
            ListTile(
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (c)=>ItemOne()));
              },
              title: Text("First Item",
              style: TextStyle(
                fontSize: 17.0,
                color: Colors.black
              ),
              ),
              leading: Icon(Icons.more,color: Colors.black,),
            ),
            ListTile(
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (c)=>ItemTwo()));
              },

              title: Text("Home Item",
                style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.black
                ),
              ),
              leading: Icon(Icons.home,color: Colors.black,),
            ),
            ListTile(
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (c)=>ItemThree()));
              },
              title: Text("Third Item",
                style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.black
                ),
              ),
              leading: Icon(Icons.photo,color: Colors.black,),
            )

          ],
        ),
      ),

      body: pageOptions[_indexpage],
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.deepOrange,
        buttonBackgroundColor: Colors.black,
        backgroundColor: Colors.green,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        index: 1,
        items: <Widget>[
          Icon(Icons.poll,size: 30.0,color: Colors.white,),
          Icon(Icons.home,size: 30.0,color: Colors.white,),
          Icon(Icons.photo,size: 30.0,color: Colors.white,)
        ],
        onTap: (int index){
           setState(() {
             _indexpage=index;
           });
        },
      ),
    );
  }
}


