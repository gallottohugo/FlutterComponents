import 'package:flutter/material.dart';

class ListviewBuilderPage extends StatefulWidget {
  @override
  _ListviewBuilderPageState createState() => _ListviewBuilderPageState();
}

class _ListviewBuilderPageState extends State<ListviewBuilderPage> {

	List<int> _listNumbers = [];
	int _lastItem = 0;
	ScrollController _scrollController = new ScrollController();

	@override
 	 void initState() {
    	super.initState();
		_add10images();
		_scrollController.addListener((){
			if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent ){
				_add10images();
			}
		});
  	}

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
			controller: _scrollController,
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

	void _add10images(){
		for (var i = 1; i < 10; i++) {
			_lastItem++;
			_listNumbers.add(_lastItem);
		}
		setState(() {
			
		});
	}


	
}