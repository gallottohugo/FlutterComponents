import 'package:flutter/material.dart';
import 'package:flutter_components/src/pages/alert_page.dart';
import 'package:flutter_components/src/routes/routes.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  	@override
  	Widget build(BuildContext context) {
		return MaterialApp(
	  		title: 'Components App',
			debugShowCheckedModeBanner: false,
			localizationsDelegates: [
   				GlobalMaterialLocalizations.delegate,
   				GlobalWidgetsLocalizations.delegate,
   				GlobalCupertinoLocalizations.delegate,
 			],
			supportedLocales: [
    			const Locale('en'), // English
				const Locale('he'), // Hebrew
				const Locale('es'), // Spanish
    			const Locale.fromSubtags(languageCode: 'zh'), // Chinese *See Advanced Locales below*
  			],
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