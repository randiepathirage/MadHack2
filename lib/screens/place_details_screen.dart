import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/models/place_model.dart';
import 'package:untitled/providers/place_data_provider.dart';

class PlaceDetailsScreen extends StatelessWidget {
  final String name,description,image;
  const PlaceDetailsScreen({required this.name,required this.description,required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15  ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(image,
                width:350,
                height: 400,),
            Padding(padding: const EdgeInsets.all(8),
            child: Text(description,
              textAlign:TextAlign.center,
              style:TextStyle(
                  color:Colors.teal)

              ),
            ),
          ],
        ),
      ),
    );
  }
}




