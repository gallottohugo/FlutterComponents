import 'package:flutter/material.dart';

class ListViewPage extends StatelessWidget {
  	@override
  	Widget build(BuildContext context) {
    	return _list();
	}
    
	ListView _list() {
		return ListView(
			children: _listItems(),
		);
	}

  	List<Widget> _listItems() {
		return [
			ListTile(title: Text('Hola Hugo')),
			Divider(),
			ListTile(title: Text('Hola Ema')),
			Divider(),
			ListTile(title: Text('Hola Juani'))
		];
  }
}