import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ItemThree extends StatefulWidget {
  @override
  _ItemThreeState createState() => new _ItemThreeState();
}

class _ItemThreeState extends State<ItemThree> {

  Future getPost()async{

    var firestore = Firestore.instance;

    QuerySnapshot snap = await firestore.collection("itemone").getDocuments();

    return snap.documents;

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: FutureBuilder(
          future: getPost(),
        builder: (context,snapshot){

            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }else{
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context,index){
                    var ourData = snapshot.data[index];
                    return Container(
                      child: Card(
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.network(ourData.data['img'],
                              fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }
              );
            }

        }
      )
    );
  }
}


