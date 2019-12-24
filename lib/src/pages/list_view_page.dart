import 'package:flutter/material.dart';
import 'package:flutter_components/src/providers/menu_provider.dart';
import 'package:flutter_components/src/utils/icons_utils.dart';

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

	List<Widget> _listItemsFuture( List<dynamic> data ) {
		final List<Widget> listWidget = [];
		for (dynamic item in data){
			final listTile = ListTile(
				title: Text(item['texto']),
				leading: getIcon(item['icon']),
				trailing: Icon(Icons.arrow_forward_ios),
				onTap: (){},
			);
			listWidget..add(listTile)
					..add(Divider());
		}
		return listWidget;
	}
}