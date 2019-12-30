import 'package:flutter/material.dart';

class ListviewBuilderPage extends StatefulWidget {
  @override
  _ListviewBuilderPageState createState() => _ListviewBuilderPageState();
}

class _ListviewBuilderPageState extends State<ListviewBuilderPage> {

	List<int> _listNumbers = [1,2,3,4,5,6,7,8,9];

  	@override
  	Widget build(BuildContext context) {
    	return Scaffold(
			appBar: AppBar(
				title: Text('Listview builder'),
			),
			body: _newListView(),
    	);
  	}

	Widget _newListView(){
		return ListView.builder(
			itemCount: _listNumbers.length,
			itemBuilder: (BuildContext context, int index){
				final _itemImg = _listNumbers[index];
				return FadeInImage(
					image: NetworkImage('https://picsum.photos/500/300/?image=$_itemImg'),
					placeholder: AssetImage('assets/down.gif'),
				);
			},
		);
	}

}