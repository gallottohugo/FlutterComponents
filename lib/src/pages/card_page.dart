import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
	@override
  	Widget build(BuildContext context) {
    	return Scaffold(
			appBar: AppBar(
				title: Text('Card page'),
			),
			body: ListView(
				padding: EdgeInsets.all(5),
				children: <Widget>[
					_cardType1(),
					_cardType1() 
				],
			),
    	);
  	}


	Widget _cardType1(){
		return Card(
			child: Column(
				children: <Widget>[
					ListTile(
						leading: Icon(Icons.photo_album, color: Colors.blue,),
						title: Text('Título del card'),
						subtitle: Text('Esta es una descripción larga de la tarjeta para que veamos que sucede cuando se pone mucho texto en este tipo de objeto'),
						trailing: Icon(Icons.chevron_right, size: 25,),
					),
					Row(
						mainAxisAlignment: MainAxisAlignment.end,
						children: <Widget>[
							FlatButton(
								color: Colors.blueGrey,
								textColor: Colors.white,
								child: Text('Cancelar'),
								onPressed: (){},
								
							),
							Divider(endIndent: 5,),
							FlatButton(
								color: Colors.blueGrey,
								textColor: Colors.white,
								child: Text('Ok'),
								onPressed: (){		},
							)
						],
					),
				],
			),
		);
	}
}