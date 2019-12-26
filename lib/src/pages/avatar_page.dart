import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  	@override
  	Widget build(BuildContext context) {
    	return Scaffold(
			appBar: AppBar(
				title: Text('Avatar page'),
				actions: <Widget>[
					Container(
						padding: EdgeInsets.all(2),
					  	child: CircleAvatar(
					  		backgroundImage: NetworkImage('http://gallottohugo.com/img/team/profile.jpg'),
					  		radius: 25,
					  	),
					),
					Container(
						margin: EdgeInsets.only(right: 10),
					  	child: CircleAvatar(
					  		child: Text('HG'),
					  	),
					), 
				],
			),
			body: Center(
				child: FadeInImage(
					image: NetworkImage('http://gallottohugo.com/img/team/profile.jpg'),
					placeholder: AssetImage('assets/down.gif'),
				),
			),
			
		);
  	}
}