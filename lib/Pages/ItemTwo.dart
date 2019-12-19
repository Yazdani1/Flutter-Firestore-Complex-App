import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class ItemTwo extends StatefulWidget {
  @override
  _ItemTwoState createState() => new _ItemTwoState();
}

class _ItemTwoState extends State<ItemTwo> {
  Future getHomePost()async{
    var firestore = Firestore.instance;
    QuerySnapshot snap = await firestore.collection("HomeData").getDocuments();
    return snap.documents;
  }
  Future<Null>getRegresh()async{
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      getHomePost();
    });
  }
  List<MaterialColor>_colorItem = [
    Colors.deepOrange,
    Colors.purple,
    Colors.red,
    Colors.pink,
    Colors.green,
    Colors.yellow,
    Colors.blueGrey
  ];

  MaterialColor color;


  @override
  Widget build(BuildContext context) {
    return new Scaffold(

     backgroundColor: Colors.grey,

      body: FutureBuilder(
          future: getHomePost(),
        builder: (context,snapshot){

            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }else{
              return RefreshIndicator(
                onRefresh: getRegresh,
                child: ListView.builder(
                    itemCount: snapshot.data.length,
                  itemBuilder: (context, index){

                      var ourData = snapshot.data[index];

                      color=_colorItem[index % _colorItem.length];

                      return Container(
                        height: 420.0,
                        margin: EdgeInsets.all(5.0),
                        child: Card(
                          elevation: 10.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)
                          ),
                          child: Column(
                            children: <Widget>[

                              //first container
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[

                                    Container(
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.all(10.0),
                                            child: CircleAvatar(
                                              child: Text(ourData.data["title"][0],style: TextStyle(fontSize: 20.0),),
                                              backgroundColor: color
                                            ),
                                          ),
                                          SizedBox(width: 5.0,),
                                          Container(
                                            child: Text(ourData.data['title'],
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    Container(
                                      margin: EdgeInsets.only(right: 20.0),
                                      child: Icon(Icons.more_horiz,size: 30.0,),
                                    ),
                                    

                                  ],
                                ),
                              ),

                              SizedBox(height: 10.0,),

                              Container(
                                margin: EdgeInsets.all(10.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.network(ourData.data['image'],
                                  height: 200.0,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8.0,),

                              Container(
                                margin: EdgeInsets.all(10.0),
                                child: Text(ourData.data['des'],
                                maxLines: 4,
                                style: TextStyle(
                                  fontSize: 17.0,
                                  color: Colors.black
                                ),
                                ),
                              )



                            ],
                          ),
                        ),
                      );
                  }
                ),
              );
            }

        }
      ),

    );
  }
}


