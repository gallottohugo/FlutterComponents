import 'package:flutter/material.dart';
import 'package:flutter_components/src/pages/alert_page.dart';
import 'package:flutter_components/src/pages/avatar_page.dart';
import 'package:flutter_components/src/pages/home_page.dart';
import 'package:flutter_components/src/pages/home_temp.dart';
 
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
			routes: <String, WidgetBuilder>{
				'home': (BuildContext) => HomePage(),
				'avatar': (BuildContext) => AvatarPage(),
				'alert': (BuildContext) => AlertPage()
			},
			onGenerateRoute: (settings){
				return MaterialPageRoute(
					//return default route
					builder: (BuildContext context) => AlertPage()
				);
			},
			
		);
  	}
}