import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  	@override
  	_InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

	String _name;

  	@override
  	Widget build(BuildContext context) {
    	return Scaffold(
			appBar: AppBar(
				title: Text('Inputs'),
			),
			body: ListView(
				padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
				children: <Widget>[
					_newImput(),
					Divider(),
					_newPerson()
				],
			),
    	);
  	}

  	Widget _newImput() {
		return TextField(
			autofocus: true,
			textCapitalization: TextCapitalization.sentences,
			decoration: InputDecoration(
				border: OutlineInputBorder(
					borderRadius: BorderRadius.circular(10)
				),
				labelText: 'Nombre',
				counter: Text('Letras ${_name.length}'),
				hintText: 'Nombre de la persona',
				hintStyle: TextStyle(color: Colors.grey),
				helperText: 'Por favor ingrese su nombre completo',
				helperStyle: TextStyle(color: Colors.grey),
				suffixIcon: Icon(Icons.accessibility_new),
				icon: Icon(Icons.account_circle)
			),
			onChanged: (value){
				setState(() {
					_name = value;
				});
			},
		);
	}

	Widget _newPerson(){
		return ListTile(title: Text(_name),);
	}
}