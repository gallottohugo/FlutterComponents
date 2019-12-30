import 'dart:async';

import 'package:flutter/material.dart';

class ListviewBuilderPage extends StatefulWidget {
  @override
  _ListviewBuilderPageState createState() => _ListviewBuilderPageState();
}

class _ListviewBuilderPageState extends State<ListviewBuilderPage> {

	List<int> _listNumbers = [];
	int _lastItem = 0;
	ScrollController _scrollController = new ScrollController();
	bool isLoading = false;

	@override
 	 void initState() {
    	super.initState();
		_add10images(); 
		_scrollController.addListener((){
			if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent ){
				//_add10images();
				_fetchData();
			}
		});
  	}



	@override
  	void dispose() {
    	// TODO: implement dispose
    	super.dispose();
		_scrollController.dispose();
  	}

  	@override
  	Widget build(BuildContext context) {
    	return Scaffold(
			appBar: AppBar(
				title: Text('Listview builder'),
			),
			body: Stack(
				children: <Widget>[
					 _newListView(),
					 _newLoading()
				],
			)
    	);
  	}

	Widget _newListView(){
		return RefreshIndicator(
			onRefresh: _getPage1,
			child: ListView.builder(
		  		controller: _scrollController,
		  		itemCount: _listNumbers.length,
		  		itemBuilder: (BuildContext context, int index){
		  			final _itemImg = _listNumbers[index];
		  			return Column(
		  				children: <Widget>[
		  					FadeInImage(
		  						image: NetworkImage('https://picsum.photos/500/300/?image=$_itemImg'),
		  						placeholder: AssetImage('assets/load.gif'),
		  					),
		  					Divider()
		  				],
		  			);
		  		},
		  	),
		);
	}

	Future<Null> _getPage1() async {
		final duration = new Duration(seconds: 2);
		new Timer(duration, (){
			_listNumbers.clear();
			_lastItem++;
			_add10images();
		});

		return Future.delayed(duration);
	}


	Widget  _newLoading(){
		if (isLoading){
			return Column(
				mainAxisSize: MainAxisSize.max,
				mainAxisAlignment: MainAxisAlignment.end,
				children: <Widget>[
					Row(
						mainAxisAlignment: MainAxisAlignment.center,
						children: <Widget>[
							CircularProgressIndicator()
						],
					),
					SizedBox(height: 15.0,)
				],
			);
		}
		else{
			return Container();
		}
	}

	void _add10images(){
		for (var i = 1; i < 10; i++) {
			_lastItem++;
			_listNumbers.add(_lastItem);
		}
		setState(() {});
	}

	Future<Null> _fetchData() async {
		isLoading = true;
		setState(() {});
		final duration = new Duration(seconds: 2);
		new Timer(duration, resposeHTTP);
	}

	void resposeHTTP(){
		isLoading = false;
		_scrollController.animateTo(
			_scrollController.position.pixels + 100,
			curve:	Curves.fastOutSlowIn,
			duration: new Duration(seconds: 2)
		);
		_add10images();
	}
	
}