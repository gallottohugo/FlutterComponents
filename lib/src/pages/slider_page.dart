import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  	@override
  	_SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

	double _currentValue = 250.0;
	bool _blockSlider = false;
	bool _switchValue = false;

  	@override
  	Widget build(BuildContext context) {
    	return Scaffold(
			appBar: AppBar(
				title: Text('Slider page'),
			),
			body: Container(
				padding: EdgeInsets.only(top: 50),
				child: Column(
					children: <Widget>[
						_newSlider(),
						_newImage(),
						Divider(),
						_newCheckBox(),
						Divider(),
						_newSwitch()
					],
				),
			)
		);
	}

	Widget _newSlider(){
		return Slider(
			label: 'Image size ${_currentValue.round()}',
			value: _currentValue,
			min: 50.0,
			max: 500.0,
			activeColor: Colors.green,
			onChanged: (_blockSlider) ? null : (value){
				setState(() {
				 	_currentValue = value;
				});
			},

		);

	}

	Widget _newImage(){
		return Image(
			image: NetworkImage('https://static3.abc.es/media/play/2019/01/24/ragnar-floki-k7qE--620x349@abc.jpg'),
			width: _currentValue,
		);
	}

	Widget _newCheckBox(){
		return CheckboxListTile(
			value: _blockSlider,
			title: Text('Active/Block image'),
			subtitle: Text('Click here to active/inactive slider.'),
			onChanged: (value){ 
				setState(() {
					_blockSlider = value;
				});
			},
		);
	}

	Widget _newSwitch(){
		return SwitchListTile(
			title: Text('Switch'),
			subtitle: Text('Swith to show how to work'),
			value: _switchValue,
			onChanged: (value){
				_switchValue = value;
			},
		);
	}


	
}