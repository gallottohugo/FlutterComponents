import 'package:flutter/material.dart';
import 'package:flutter_components/src/pages/list_view_page.dart';

class HomePage extends StatelessWidget {
  	@override
  	Widget build(BuildContext context) {
    	return Scaffold(
			appBar: AppBar(
				title: Text('Home Page'),
				centerTitle: true,
			),
			body: ListViewPage(),
    	);
  	}
}