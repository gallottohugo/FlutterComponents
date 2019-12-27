

import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  	@override
  	_InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

	String _name = "";
	String _email = "";
	String _password = "";
	String _date = '';
	TextEditingController _textEditingController = new TextEditingController();

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
					_newEmail(),
					Divider(),
					_newPassword(),
					Divider(),
					_newDate(context),
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
				labelText: 'Name',
				counter: Text('Letras ${_name.length}'),
				hintText: 'Full name',
				hintStyle: TextStyle(color: Colors.grey),
				helperText: 'Type your full name please!',
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

	Widget _newEmail(){
		return TextField(
			keyboardType: TextInputType.emailAddress,
			decoration: InputDecoration(
				labelText: 'Email',
				border: OutlineInputBorder(
					borderRadius: BorderRadius.circular(10)
				),
				counter: Text('Letras ${_email.length}'),
				hintText: 'Email',
				hintStyle: TextStyle(color: Colors.grey),
				helperText: 'Type your email plase!',
				helperStyle: TextStyle(color: Colors.grey),
				suffixIcon: Icon(Icons.alternate_email),
				icon: Icon(Icons.email)
			),
			onChanged: (value) => setState(() {
				_email = value;
			})
		);
	}

	Widget _newPassword() {
		return TextField(
			obscureText: true,
			decoration: InputDecoration(
				border: OutlineInputBorder(
					borderRadius: BorderRadius.circular(10)
				),
				labelText: 'Password',
				counter: Text('Letras ${_password.length}'),
				hintText: 'Account password',
				hintStyle: TextStyle(color: Colors.grey),
				helperText: 'Type your password please!',
				helperStyle: TextStyle(color: Colors.grey),
				suffixIcon: Icon(Icons.lock),
				icon: Icon(Icons.lock_outline)
			),
			onChanged: (value){ 
				setState(() {
					_password = value;
				});
			},
		);
	}

	Widget _newDate(BuildContext context){
		return TextField(
			controller: _textEditingController,
			enableInteractiveSelection: false,
			decoration: InputDecoration(
				border: OutlineInputBorder(
					borderRadius: BorderRadius.circular(10)
				),
				labelText: 'Birthdate',
				counter: Text('Letras ${_password.length}'),
				hintText: 'Your birthdate',
				hintStyle: TextStyle(color: Colors.grey),
				helperText: 'Select your birthdate please!',
				helperStyle: TextStyle(color: Colors.grey),
				suffixIcon: Icon(Icons.date_range),
				icon: Icon(Icons.calendar_today)
			),
			onTap: (){
				FocusScope.of(context).requestFocus(new FocusNode());
				_selectDate(context);
			},
		);
	}

	_selectDate (BuildContext context) async {
		DateTime dateTime = await showDatePicker(
			context: context,
	 		initialDate: DateTime.now(),
			firstDate: DateTime(1900),
			lastDate: DateTime(2050),
			locale: Locale('es'),
			builder: (BuildContext context, Widget child) {
				return Theme(
					data: ThemeData.dark(),
					child: child,
				);
			},
		);
		if (dateTime != null){
			setState(() {
				_date = dateTime.toString();
				_textEditingController.text = _date;
			});
		}
		return dateTime;
	}
	Widget _newPerson(){
		return Column(
			children: <Widget>[
				ListTile(title: Text('Nombre: $_name'),),
				ListTile(title: Text('Email: $_email'),),
				ListTile(title: Text('Password: $_password'),),
				ListTile(title: Text('Date: $_date'),),
			],
		);
		
	}
}