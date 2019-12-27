import 'package:flutter/material.dart';
import 'package:flutter_components/src/pages/alert_page.dart';
import 'package:flutter_components/src/pages/animated_container_page.dart';
import 'package:flutter_components/src/pages/avatar_page.dart';
import 'package:flutter_components/src/pages/card_page.dart';
import 'package:flutter_components/src/pages/home_page.dart';



Map<String, WidgetBuilder> getApplicationRoutes(){
	return <String, WidgetBuilder> {
		'home'   : (BuildContext context) => HomePage(),
		'avatar' : (BuildContext context) => AvatarPage(),
		'alert'  : (BuildContext context) => AlertPage(),
		'card'  : (BuildContext context) =>CardPage(),
    'animated_container': (BuildContext context) =>AnimatedContainerPage()
	};
}

