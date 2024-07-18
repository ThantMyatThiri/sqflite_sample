import 'package:flutter/material.dart';
import 'package:sqflite_sample/forms/form_data_details.dart';
import 'package:sqflite_sample/forms/form_data_list.dart';

class MyApp extends StatelessWidget {
  const MyApp({ super.key });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
                    appBarTheme: const AppBarTheme( color: Colors.orange, centerTitle: true, titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                    floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Colors.orange ),
                    tabBarTheme: const TabBarTheme(labelColor: Colors.deepOrangeAccent,unselectedLabelColor: Colors.grey,indicator: BoxDecoration( border: Border( top: BorderSide( color: Colors.deepOrangeAccent, width: 2.0, ),),),),
      ),
      onGenerateRoute: (RouteSettings routeSettings){
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context){
            switch (routeSettings.name) {
              case FormDataList.routeName: return const FormDataList();
              case FormDetailData.routeName: return const FormDetailData();
              default: return const FormDataList();
            }
          });
      },
    );
  }
}