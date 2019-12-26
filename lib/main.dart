import 'package:flutter/material.dart';
import 'package:flutter_components/src/pages/alert_page.dart';
import 'package:flutter_components/src/routes/routes.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  	@override
  	Widget build(BuildContext context) {
		return MaterialApp(
	  		title: 'Components App',
			debugShowCheckedModeBanner: false,
	  		//home: HomePageTemp()
			//home: HomePage(),
			initialRoute: 'home',
			routes: getApplicationRoutes(),
			onGenerateRoute: (settings){
				return MaterialPageRoute(
					//return default route
					builder: (BuildContext context) => AlertPage()
				);
			},
			
		);
  	}
}