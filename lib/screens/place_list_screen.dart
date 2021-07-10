import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/models/place_model.dart';
import 'package:untitled/providers/place_data_provider.dart';
import 'package:untitled/screens/place_details_screen.dart';

class PlaceListScreen extends StatefulWidget {
  const PlaceListScreen({Key? key}) : super(key: key);

  @override
  _PlaceListScreenState createState() => _PlaceListScreenState();
}

class _PlaceListScreenState extends State<PlaceListScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final mdl=Provider.of<PlaceDataProvider>(context,listen: false);
    mdl.loadPlaces();
  }
  @override
  Widget build(BuildContext context) {
    final mdl=Provider.of<PlaceDataProvider>(context);

    return Scaffold(
      appBar: AppBar(
          title: Text("Travel World"),
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(20),
          itemCount: mdl.placeList.length,
          itemBuilder: (context,index){
            PlaceModel place = mdl.placeList[index];
        return PlacesViewCard(
            name:place.name,
            shortDetail:place.shortDetail,
            image:place.image,
            description:place.description,
);
    })
    );
  }
}

class PlacesViewCard extends StatelessWidget {
  final String image;
  final String name;
  final String shortDetail;
  final String description;

  PlacesViewCard({required this.shortDetail,required this.image,required this.name,required this.description});

  @override
  Widget build(BuildContext context) {
    final mdl=Provider.of<PlaceDataProvider>(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius:BorderRadius.circular(8),
      ),
      child:InkWell(
        onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PlaceDetailsScreen(name:name, description: description,image:image)),
          );
        },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15  ),
        child: Column(
          children: [
            Container(
              height:200,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(image),fit:BoxFit.cover)
              ),
            ),
            SizedBox(height: 20,),
            Text(name,
             style:TextStyle(
                 fontWeight:FontWeight.bold,
                 fontSize:20,
                 color:Colors.teal )),
            SizedBox(height: 15,),
            Text(shortDetail,
                textAlign:TextAlign.center,
              style:TextStyle(
                  color:Colors.amber
              )
            )
          ],
        ),
      ),
      ),
    );
  }
}



