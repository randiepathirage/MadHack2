import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:untitled/providers/place_data_provider.dart';
import 'package:untitled/screens/place_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: providers,
    child: MaterialApp(
      theme:ThemeData(
          appBarTheme: AppBarTheme(backgroundColor:Colors.teal)
      ),
      home: PlaceListScreen(),
    ),
    );
  }
}

List<SingleChildWidget> providers =[
  ChangeNotifierProvider<PlaceDataProvider>(create:(_)=> PlaceDataProvider())
];

