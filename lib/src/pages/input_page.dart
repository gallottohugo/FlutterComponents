

import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  	@override
  	_InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

	String _name = '';
	String _email = '';
	String _password = '';
	String _date = '';
	TextEditingController _textEditingController = new TextEditingController();
	List<String> _status = ['','soltero', 'casado', 'comprometido', 'viudo'];
	String _statusSelected = '';

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
					_newDropDown(),
					Divider(thickness: 0.0,),
					Divider(
						height: 100.0,
						color: Colors.white,
					),
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
	
	
	List<DropdownMenuItem<String>> _listDropDownItems() {
		List<DropdownMenuItem<String>> _list = new List();
		for (String item in _status){
			_list.add(DropdownMenuItem(
				child: Text(item),
				value: item,
			));
		}
		return _list;
	}
	
	Widget _newDropDown(){
		return Row(
			children: <Widget>[
				Icon(Icons.person_pin_circle, color: Colors.blue,),
				SizedBox(width: 30.0,),
				Container(
					child: Text('Estado civil'),
				),
				SizedBox(width: 30.0,),
				DropdownButton(
					value: _statusSelected,
					items: _listDropDownItems() ,
					onChanged: (value){
						setState(() {
							_statusSelected = value;
						});
					},
				)
			],
			
		);
		
	}
	
	Widget _newPerson(){
		return Column(
			children: <Widget>[
				Row(
					children: <Widget>[
						Icon(Icons.format_list_bulleted, color: Colors.blue, size: 30.0),
						SizedBox(width: 10.0,),
						Text('People',style: TextStyle(color: Colors.blue, fontSize: 20.0),),
					],
				),
				ListTile(
					leading: Icon(Icons.person),
					title: Text('Nombre: $_name'),
					subtitle: Text('$_email'),
					trailing: Text('$_statusSelected'),
				),
			],
		);
		
	}
}