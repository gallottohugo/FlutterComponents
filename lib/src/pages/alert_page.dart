import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  	@override
  	Widget build(BuildContext context) {
    	return Scaffold(
			appBar: AppBar(
				title: Text('Alert page'),
			),
			body: Center(
				child: RaisedButton(
					child: Text('Mostrar alertas'),
					color: Colors.blue,
					textColor: Colors.white,
					onPressed: (){
						_showAlert(context);
					},
				),
			),
      		floatingActionButton: FloatingActionButton	(
        		child: Icon( Icons.arrow_back),
				onPressed: (){
					Navigator.pop(context);	
				},
      
      		),
		);
  	}

	_showAlert(BuildContext context){
		showDialog (
			context: context,
			barrierDismissible: true,
			builder: (context){
				return AlertDialog(

					title: Text('Alert dialog title.'),
					content: Column(
						mainAxisSize: MainAxisSize.min,
						children: <Widget>[
							ListTile(
								leading: Icon(Icons.cloud_off),
								title: Text('Sin coneción a internet'),
								subtitle: Text('Desea reconectar?'),
							),
							Row(children: <Widget>[
								FlutterLogo(
									size: 50,
								)
							],)
						],
					),
					actions: <Widget>[
						FlatButton(
							child: Text('Cancelar'),
							onPressed: ()=> Navigator.of(context).pop(),
						),
						FlatButton(
							child: Text('ok'),
							onPressed: (){},
						)
					],
				);
			}	 
		);
	}
}