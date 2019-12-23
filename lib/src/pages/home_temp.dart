import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

final _options = ['uno', 'dos', 'tres', 'cuatro', 'cinco', 'seis', 'siete', 
'ocho', 'nueve', 'diez', 'once', 'doce', 'trece', 'catorce', 'quince'];
	@override
	Widget build(BuildContext context) {
		return Scaffold(
      		appBar: AppBar(
        		title: Text('Temp components'),
      		),
      		body: ListView(
        		//children: _itemsCreate()
				children: _itemsCreateShort(),
      		),
    	);
	}


	List<Widget> _itemsCreate(){
		List<Widget> _list = new List<Widget>();
		for (String item in _options){
			_list..add(ListTile(title: Text(item)))
				 ..add(Divider());
		}
		return _list;
	}

	List<Widget> _itemsCreateShort() {
		return _options.map( (item) {
			return Column(
			  	children: <Widget>[
			    	ListTile(
						title: Text('$item!'),
						subtitle: Text('Subtitle $item'),
						leading: Icon(Icons.local_see),
						trailing: Icon(Icons.arrow_forward_ios),
						onTap: (){
							
						},
					),
					Divider()
			  	],
			);
		}).toList();
		
	}
}