import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
	@override
  	Widget build(BuildContext context) {
    	return Scaffold(
			appBar: AppBar(
				title: Text('Card page'),
			),
			body: ListView(
				padding: EdgeInsets.all(15),
				children: <Widget>[
					_cardType1(),
					SizedBox(height: 30),
					_cardType2()
				],
			),
    	);
  	}


	Widget _cardType1(){
		return Card(
			elevation: 10,
			shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
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
							),
							Divider(endIndent: 5,),
						],
					),
				],
			),
		);



	}

	Widget _cardType2(){
		return Card(
			shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
			child: Column(
				children: <Widget>[
					FadeInImage(
						image: NetworkImage('http://t1.gstatic.com/images?q=tbn:ANd9GcQz-HknT7ciZq9Gcng-OqZ-sd_l1y2Xp97NHeLgZh-Q5jZeBJcSdyh40G4veotn_V9tnDsX-FyDpsBIMS4q8Uo'),
						placeholder: AssetImage('assets/down.gif'),
						fadeInDuration: Duration(milliseconds: 250),
						height: 350,
						fit: BoxFit.cover,

					),
					Container(
						child: Text('Descripción de la imagen')
					)
				],
			),
		);
	}
}