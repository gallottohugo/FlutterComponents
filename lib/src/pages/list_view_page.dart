import 'package:flutter/material.dart';
import 'package:flutter_components/src/providers/menu_provider.dart';

class ListViewPage extends StatelessWidget {
  	@override
  	Widget build(BuildContext context) {
    	return _list();
	}
    
	Widget _list() {
		return FutureBuilder(
			initialData: [],
			future: menuProvider.loadData(),
			builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){
				return ListView(
					children: _listItemsFuture(snapshot.data),
				);
			},
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

	List<Widget> _listItemsFuture( List<dynamic> data ) {
		final List<Widget> listWidget = [];
		for (dynamic item in data){
			final listTile = ListTile(
				title: Text(item['texto']),
				leading: Icon(Icons.account_circle, color: Colors.blue,),
				trailing: Icon(Icons.arrow_forward_ios, color: Colors.deepOrange,),
				onTap: (){

				},
			);
			listWidget..add(listTile)
					..add(Divider());
		}
		print("-------------------");
		print(listWidget);
		print("-------------------");
		return listWidget;
	}
}