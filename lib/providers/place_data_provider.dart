import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled/models/place_model.dart';

class PlaceDataProvider with ChangeNotifier{
  List<PlaceModel> placeList = [];
  loadPlaces(){
    FirebaseFirestore.instance.collection('places').get().then((querySnapshot){
      querySnapshot.docs.forEach((queryDocSnapshot){
        if(queryDocSnapshot.exists){
          placeList.add(PlaceModel.fromJson(queryDocSnapshot.data()));
        }
      });
      notifyListeners();
    });
  }
}